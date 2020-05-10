import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import './bloc.dart';

class BookSeatSlotBloc extends Bloc<BookSeatSlotEvent, BookSeatSlotState> {
  SessionRepository sessionRepository;
  SeatSlotRepository seatSlotRepository;

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
        seatSlotByTypes: seatSlotByTypes,
      );
    } catch (e, s) {
      print(s);
      yield state.copyWith(
        isLoading: false,
        msg: e.toString(),
      );
    }
  }
}
