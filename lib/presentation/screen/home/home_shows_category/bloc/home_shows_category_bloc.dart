import 'dart:async';
import 'dart:collection';

import 'package:find_seat/model/entity/categoryy.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/home_shows_category/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeShowsCategoryBloc
    extends Bloc<HomeShowsCategoryEvent, HomeShowsCategoryState> {
  HomeBloc homeBloc;
  StreamSubscription subscription;

  HomeShowsCategoryBloc({this.homeBloc}) {
    subscription = homeBloc.listen((state) {
      if (state is HomeLoaded) {
        add(DisplayShowsByCategory(state.response));
      }
    });
  }

  @override
  HomeShowsCategoryState get initialState => ShowsByCategoryNotLoaded();

  @override
  Stream<HomeShowsCategoryState> mapEventToState(
      HomeShowsCategoryEvent event) async* {
    if (event is DisplayShowsByCategory) {
      List<MapEntry<Categoryy, List<Show>>> list = [];

      final homeResponse = event.homeResponse;
      homeResponse.showByCategories.forEach((data) {
        final category = homeResponse.categories
            .firstWhere((category) => category.id == data.categoryId);
        list.add(MapEntry(category, data.shows));
      });

      yield ShowsByCategoryLoaded(list: list);
    }
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
