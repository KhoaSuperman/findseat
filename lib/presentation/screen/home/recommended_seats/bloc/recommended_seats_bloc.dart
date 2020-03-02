import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/show.dart';
import 'package:meta/meta.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/recommended_seats/bloc/bloc.dart';

class RecommendedSeatsBloc
    extends Bloc<RecommendedSeatsEvent, RecommendedSeatsState> {
  final HomeBloc homeBloc;
  StreamSubscription subscription;

  RecommendedSeatsBloc({@required this.homeBloc}) {
    subscription = homeBloc.listen((state) {
      if (state is HomeLoaded) {
        add(DisplayRecommendedSeats(state.response.recommendedSeats));
      }
    });
  }

  @override
  RecommendedSeatsState get initialState => RecommendedSeatsNotLoaded();

  @override
  Stream<RecommendedSeatsState> mapEventToState(
      RecommendedSeatsEvent event) async* {
    if (event is DisplayRecommendedSeats) {
      yield* _mapDisplayRecommendedSeatsToState(event.shows);
    }
  }

  Stream<RecommendedSeatsState> _mapDisplayRecommendedSeatsToState(
      List<Show> shows) async* {
    yield RecommendedSeatsLoaded(shows);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
