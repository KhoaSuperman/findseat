import 'dart:async';
import 'dart:collection';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/item_grid_seat_slot_vm.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/item_seat_row_vm.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/item_seat_slot_vm.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class BookSeatSlotBloc extends Bloc<BookSeatSlotEvent, BookSeatSlotState> {
  SessionRepository sessionRepository;
  SeatSlotRepository seatSlotRepository;
  int seatCount;
  SEAT_TYPE selectedSeatType;

  HashMap<String, bool> selectedSeats = HashMap();
  List<SeatType> seatSlotByTypes;

  BookSeatSlotBloc({
    this.sessionRepository,
    this.seatSlotRepository,
    this.seatCount,
    this.selectedSeatType,
  });

  @override
  BookSeatSlotState get initialState => BookSeatSlotState(isLoading: true);

  @override
  Stream<BookSeatSlotState> mapEventToState(
    BookSeatSlotEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    } else if (event is ClickSelectSeatSlot) {
      yield* _mapClickSelectSeatSlotToState(event.itemSeatSlotVM);
    } else if (event is DismissMessageReachedLimitSeatSlot) {
      yield state.copyWith(isReachedLimitSeatSlot: false);
    } else if (event is DismissMessageWrongSeatType) {
      yield state.copyWith(isSelectWrongSeatType: false);
    } else if (event is ClickButtonPay) {
      yield state.copyWith(isOpenPaymentMethod: true);
    } else if (event is OpenedPaymentMethodScreen) {
      yield state.copyWith(isOpenPaymentMethod: false);
    }
  }

  Stream<BookSeatSlotState> _mapOpenScreenToState() async* {
    try {
      Show show = await sessionRepository.getShow();
      TimeSlot selectedTimeSlot = await sessionRepository.getSelectedTimeSlot();
      BookTimeSlot bookTimeSlot = await sessionRepository.getBookTimeSlot();
      //
      seatSlotByTypes = await seatSlotRepository.getListSeatSlotBySeatTypes();

      yield state.copyWith(
        isLoading: false,
        show: show,
        selectedTimeSlot: selectedTimeSlot,
        bookTimeSlot: bookTimeSlot,
        itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
      );
    } catch (e, s) {
      print(s);
      yield state.copyWith(
        isLoading: false,
        msg: e.toString(),
      );
    }
  }

  Stream<BookSeatSlotState> _mapClickSelectSeatSlotToState(
      ItemSeatSlotVM item) async* {
    if (item.seatType == selectedSeatType) {
      if (!selectedSeats.containsKey(item.seatId)) {
        if (!isReachedLimitSlot()) {
          selectedSeats[item.seatId] = true;
          yield state.copyWith(
            itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
            selectedSeatIds: getSelectedSeatSlotId(),
            totalPrice: calculateTotalPrice(),
          );
        } else {
          yield state.copyWith(isReachedLimitSeatSlot: true);
        }
      } else {
        bool isSelected = !selectedSeats[item.seatId];
        if ((isSelected && !isReachedLimitSlot()) || !isSelected) {
          selectedSeats[item.seatId] = isSelected;
          yield state.copyWith(
            itemGridSeatSlotVMs: toItemGridSeatSlotVMs(seatSlotByTypes),
            selectedSeatIds: getSelectedSeatSlotId(),
            totalPrice: calculateTotalPrice(),
          );
        } else {
          yield state.copyWith(isReachedLimitSeatSlot: true);
        }
      }
    } else {
      yield state.copyWith(isSelectWrongSeatType: true);
    }
  }

  bool isReachedLimitSlot() {
    return getSelectedSeatSlotId().length == seatCount;
  }

  List<String> getSelectedSeatSlotId() {
    return selectedSeats.keys.where(
      (key) {
        return selectedSeats[key];
      },
    ).toList();
  }

  double calculateTotalPrice() {
    return SeatType.SAMPLE_DATA
            .firstWhere((type) => type.type == selectedSeatType)
            .price *
        getSelectedSeatSlotId().length;
  }

  @visibleForTesting
  List<ItemGridSeatSlotVM> toItemGridSeatSlotVMs(
      List<SeatType> seatSlotByTypes) {
    return seatSlotByTypes.map(
      (seatSlotType) {
        final seatTypeName =
            '\$ ${seatSlotType.price} ${seatSlotType.type.toText().toUpperCase()}';
        final maxColumn = seatSlotType.seatRows[0].count + 1;

        return ItemGridSeatSlotVM(
          seatTypeName: seatTypeName,
          maxColumn: maxColumn,
          seatRowVMs:
              _toItemSeatRowVMs(seatSlotType.seatRows, seatSlotType.type),
        );
      },
    ).toList();
  }

  List<ItemSeatRowVM> _toItemSeatRowVMs(
      List<SeatRow> seatRows, SEAT_TYPE seatType) {
    return seatRows.map(
      (seatRow) {
        final itemRowName = '${seatRow.rowId}';
        return ItemSeatRowVM(
          itemRowName: itemRowName,
          seatSlotVMs: _toItemSeatSlotVMs(seatRow, seatRow.count, seatType),
        );
      },
    ).toList();
  }

  List<ItemSeatSlotVM> _toItemSeatSlotVMs(
      SeatRow seatRow, int count, SEAT_TYPE seatType) {
    return Iterable<int>.generate(count).map(
      (i) {
        final seatId = "${seatRow.rowId}$i";

        final isOff = seatRow.offs.contains(i);
        final isBooked = seatRow.booked.contains(i);
        final isSelected =
            selectedSeats.containsKey(seatId) && selectedSeats[seatId];

        return ItemSeatSlotVM(
          seatId: seatId,
          isBooked: isBooked,
          isOff: isOff,
          isSelected: isSelected,
          seatType: seatType,
        );
      },
    ).toList();
  }
}
