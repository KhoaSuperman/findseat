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

  HashMap<String, bool> selectedSeats = HashMap();

  BookSeatSlotBloc({
    this.sessionRepository,
    this.seatSlotRepository,
  });

  @override
  BookSeatSlotState get initialState => BookSeatSlotState(isLoading: true);

  @override
  Stream<BookSeatSlotState> mapEventToState(
    BookSeatSlotEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    }
  }

  Stream<BookSeatSlotState> _mapOpenScreenToState() async* {
    try {
      Show show = await sessionRepository.getShow();
      TimeSlot selectedTimeSlot = await sessionRepository.getSelectedTimeSlot();
      BookTimeSlot bookTimeSlot = await sessionRepository.getBookTimeSlot();
      //
      List<SeatType> seatSlotByTypes =
          await seatSlotRepository.getListSeatSlotBySeatTypes();

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
          seatRowVMs: _toItemSeatRowVMs(seatSlotType.seatRows),
        );
      },
    ).toList();
  }

  List<ItemSeatRowVM> _toItemSeatRowVMs(List<SeatRow> seatRows) {
    return seatRows.map(
      (seatRow) {
        final itemRowName = '${seatRow.rowId}';
        return ItemSeatRowVM(
          itemRowName: itemRowName,
          seatSlotVMs: _toItemSeatSlotVMs(seatRow, seatRow.count),
        );
      },
    ).toList();
  }

  List<ItemSeatSlotVM> _toItemSeatSlotVMs(SeatRow seatRow, int count) {
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
        );
      },
    ).toList();
  }
}
