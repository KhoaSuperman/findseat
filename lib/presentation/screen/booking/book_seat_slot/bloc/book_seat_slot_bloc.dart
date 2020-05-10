import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import './bloc.dart';

class BookSeatSlotBloc extends Bloc<BookSeatSlotEvent, BookSeatSlotState> {
  SessionRepository sessionRepository;

  BookSeatSlotBloc({this.sessionRepository});

  @override
  BookSeatSlotState get initialState => BookSeatSlotState();

  //    show
//    cine
//    keep in mind, seat type is static data, price is fixed
//    parse json API

  @override
  Stream<BookSeatSlotState> mapEventToState(
    BookSeatSlotEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    }
  }

  Stream<BookSeatSlotState> _mapOpenScreenToState() async* {
    Show show = await sessionRepository.getShow();
    TimeSlot selectedTimeSlot = await sessionRepository.getSelectedTimeSlot();
    BookTimeSlot bookTimeSlot = await sessionRepository.getBookTimeSlot();

    yield state.copyWith(
      show: show,
      selectedTimeSlot: selectedTimeSlot,
      bookTimeSlot: bookTimeSlot,
    );
  }
}
