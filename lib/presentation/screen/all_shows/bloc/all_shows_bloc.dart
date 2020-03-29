import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:find_seat/presentation/screen/all_shows/bloc/bloc.dart';

class AllShowsBloc extends Bloc<AllShowsEvent, AllShowsState> {
  ShowRepository showRepository;

  AllShowsBloc({this.showRepository});

  @override
  AllShowsState get initialState => LoadingData();

  @override
  Stream<AllShowsState> mapEventToState(AllShowsEvent event) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    } else if (event is SearchQueryChanged) {
      yield* _mapSearchQueryChangedToState();
    }
  }

  Stream<AllShowsState> _mapOpenScreenToState() async* {
    yield LoadingData();

    try {
      final response = await showRepository.getAllShowsByType();
      yield DisplayListShows(
          meta: Meta(
        nowShowing: response.nowShowing,
        comingSoon: response.comingSoon,
        exclusive: response.exclusive,
      ));
    } catch (e) {
      yield NoData(msg: e.toString());
    }
  }

  Stream<AllShowsState> _mapSearchQueryChangedToState() async* {}
}

class Meta {
  List<Show> nowShowing;
  List<Show> comingSoon;
  List<Show> exclusive;

  Meta({this.nowShowing, this.comingSoon, this.exclusive});
}
