import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import './bloc.dart';

class BookSeatTypeBloc extends Bloc<BookSeatTypeEvent, BookSeatTypeState> {
  SessionRepository sessionRepository;

  BookSeatTypeBloc({this.sessionRepository});

  @override
  BookSeatTypeState get initialState => InitialBookSeatTypeState();

  @override
  Stream<BookSeatTypeState> mapEventToState(
    BookSeatTypeEvent event,
  ) async* {
    if (event is OpenScreen) {
      Show show = await sessionRepository.getShow();
      TimeSlot selectedTimeSlot = await sessionRepository.getSelectedTimeSlot();
      List<TimeSlot> others = await sessionRepository.getOtherTimeSlots();

      yield LoadedData(
        show: show,
        selectedTimeSlot: selectedTimeSlot,
        others: others,
      );
    }
  }
}
