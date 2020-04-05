import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class BookTimeSlotBloc extends Bloc<BookTimeSlotEvent, BookTimeSlotState> {
  BookTimeSlotRepository bookTimeSlotRepository;

  //must be param of constructor
  String showId;

  BookTimeSlotBloc({@required this.bookTimeSlotRepository});

  @override
  BookTimeSlotState get initialState => DisplayListBookTimeSlot.loading();

  @override
  Stream<BookTimeSlotState> mapEventToState(
    BookTimeSlotEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    } else if (event is ClickIconSearch) {
      yield UpdateToolbarState(showSearchField: true);
    } else if (event is ClickCloseSearch) {
      yield UpdateToolbarState(showSearchField: false);
      yield* _mapSearchQueryChangedToState("");
    } else if (event is SearchQueryChanged) {
      yield* _mapSearchQueryChangedToState(event.keyword);
    }
  }

  Stream<BookTimeSlotState> _mapOpenScreenToState() async* {
    yield UpdateToolbarState(showSearchField: false);
    yield DisplayListBookTimeSlot.loading();

    try {
      final responses = await bookTimeSlotRepository.getAllShowsByType(showId);

      yield DisplayListBookTimeSlot.data(toBookTimeSlots(responses));
    } catch (e) {
      yield DisplayListBookTimeSlot.error(e.toString());
    }
  }

  Stream<BookTimeSlotState> _mapSearchQueryChangedToState(
      String keyword) async* {
    yield DisplayListBookTimeSlot.loading();

    try {
      final responses = await bookTimeSlotRepository.getAllShowsByType(showId);

      //this should be execute at server side
      bool query(BookingTimeSlotByCineResponse response) =>
          keyword.isEmpty ||
          response.cine.name.toLowerCase().contains(keyword.toLowerCase());

      final result = responses.where(query).toList();

      yield DisplayListBookTimeSlot.data(toBookTimeSlots(result));
    } catch (e) {
      yield DisplayListBookTimeSlot.error(e.toString());
    }
  }

  static List<BookTimeSlot> toBookTimeSlots(
      List<BookingTimeSlotByCineResponse> responses) {
    return responses
        .map((response) => BookTimeSlot(
              cine: response.cine,
              tami: response.tami,
              timeSlots: response.timeSlots,
            ))
        .toList();
  }
}
