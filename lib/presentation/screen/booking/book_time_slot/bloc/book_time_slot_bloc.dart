import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/api/response/api_response.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class BookTimeSlotBloc extends Bloc<BookTimeSlotEvent, BookTimeSlotState> {
  BookTimeSlotRepository bookTimeSlotRepository;
  SessionRepository sessionRepo;

  //must be param of constructor
  String showId;

  BookTimeSlotBloc({
    @required this.bookTimeSlotRepository,
    @required this.sessionRepo,
  });

  @override
  BookTimeSlotState get initialState => BookTimeSlotState(isLoading: true);

  @override
  Stream<BookTimeSlotState> mapEventToState(
    BookTimeSlotEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    } else if (event is ClickIconSearch) {
      yield* _mapClickIconSearchToState();
    } else if (event is ClickCloseSearch) {
      yield* _mapClickCloseSearchToState();
    } else if (event is SearchQueryChanged) {
      yield* _mapSearchQueryChangedToState(event.keyword);
    } else if (event is SelectTimeSlot) {
      yield* _mapSelectTimeSlotToState(event.selectedTimeSlot, event.bookTimeSlot);
    } else if (event is OpenedBookSeatTypeScreen) {
      yield* _mapOpenedBookSeatTypeScreenToState();
    }
  }

  Stream<BookTimeSlotState> _mapSelectTimeSlotToState(
      TimeSlot selectedTimeSlot, BookTimeSlot bookTimeSlot) async* {
    //cache
    await sessionRepo.cacheSelectedTimeSlot(selectedTimeSlot);
    await sessionRepo.cacheBookTimeSlot(bookTimeSlot);

    yield state.copyWith(isOpenBookSeatTypeScreen: true);
  }

  Stream<BookTimeSlotState> _mapOpenedBookSeatTypeScreenToState() async* {
    yield state.copyWith(isOpenBookSeatTypeScreen: false);
  }

  Stream<BookTimeSlotState> _mapOpenScreenToState() async* {
    try {
      final responses = await bookTimeSlotRepository.getAllShowsByType(showId);

      yield state.copyWith(
        isLoading: false,
        list: toBookTimeSlots(responses),
      );
    } catch (e) {
      yield state.copyWith(msg: e.toString());
    }
  }

  Stream<BookTimeSlotState> _mapClickIconSearchToState() async* {
    //isLoading = false because in testing, initialState isLoading = true
    yield state.copyWith(isLoading: false, showSearchField: true);
  }

  Stream<BookTimeSlotState> _mapClickCloseSearchToState() async* {
    yield state.copyWith(showSearchField: false);
    yield* _mapSearchQueryChangedToState("");
  }

  Stream<BookTimeSlotState> _mapSearchQueryChangedToState(
      String keyword) async* {
    yield state.copyWith(isLoading: true);

    try {
      final responses = await bookTimeSlotRepository.getAllShowsByType(showId);

      final query = filterFake(keyword);
      final result = responses.where(query).toList();

      yield state.copyWith(
        isLoading: false,
        list: toBookTimeSlots(result),
      );
    } catch (e) {
      yield state.copyWith(msg: e.toString());
    }
  }

  //this should be execute at server side
  static bool Function(BookingTimeSlotByCineResponse response) filterFake(
      String keyword) {
    bool query(BookingTimeSlotByCineResponse response) =>
        keyword.isEmpty ||
        response.cine.name.toLowerCase().contains(keyword.toLowerCase());
    return query;
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
