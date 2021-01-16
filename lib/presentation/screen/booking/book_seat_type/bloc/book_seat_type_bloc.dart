import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import './bloc.dart';

class BookSeatTypeBloc extends Bloc<BookSeatTypeEvent, BookSeatTypeState> {
  SessionRepository sessionRepository;

  BookSeatTypeBloc({this.sessionRepository});

  @override
  BookSeatTypeState get initialState => BookSeatTypeState(
        seatCount: 2,
        selectedSeatType: SEAT_TYPE.KING,
      );

  @override
  Stream<BookSeatTypeState> mapEventToState(
    BookSeatTypeEvent event,
  ) async* {
    if (event is OpenScreen) {
      Show show = await sessionRepository.getShow();
      TimeSlot selectedTimeSlot = await sessionRepository.getSelectedTimeSlot();
      BookTimeSlot bookTimeSlot = await sessionRepository.getBookTimeSlot();

      yield state.copyWith(
        show: show,
        selectedTimeSlot: selectedTimeSlot,
        bookTimeSlot: bookTimeSlot,
      );
    } else if (event is ClickHowManySeat) {
      yield state.copyWith(seatCount: event.seatCount);
    } else if (event is ClickSelectSeatType) {
      yield state.copyWith(selectedSeatType: event.selectedSeatType);
    } else if (event is ClickSelectSeats) {
      yield state.copyWith(isOpenBookSeatSlotScreen: true);
    } else if (event is OpenedBookSeatSlotScreen) {
      yield state.copyWith(isOpenBookSeatSlotScreen: false);
    }
  }
}
