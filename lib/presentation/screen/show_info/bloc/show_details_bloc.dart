import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/show_info/bloc/show_details_event.dart';
import 'package:find_seat/presentation/screen/show_info/bloc/show_details_state.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class ShowDetailsBloc extends Bloc<ShowDetailsEvent, ShowDetailsState> {
  SessionRepository sessionRepository;

  ShowDetailsBloc({required this.sessionRepository}) : super(InitialShowDetailsState());

  @override
  ShowDetailsState get initialState => InitialShowDetailsState();

  @override
  Stream<ShowDetailsState> mapEventToState(
    ShowDetailsEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield InitialShowDetailsState();
    } else if (event is ClickBtnBook) {
      await sessionRepository.cacheShow(event.show);
      yield OpenBookTimeSlotScreen(open: true);
    } else if (event is OpenedBookTimeSlotScreen) {
      yield OpenBookTimeSlotScreen(open: false);
      yield InitialShowDetailsState();
    }
  }
}
