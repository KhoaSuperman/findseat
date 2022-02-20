import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:find_seat/model/entity/categoryy.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/home_categories/bloc/bloc.dart';

class HomeCategoryBloc extends Bloc<HomeCategoriesEvent, HomeCategoriesState> {
  HomeBloc homeBloc;
  late StreamSubscription subscription;

  HomeCategoryBloc({required this.homeBloc}) : super(HomeCategoriesNotLoaded()) {
    subscription = homeBloc.stream.listen(
      (state) {
        if (state is HomeLoaded) {
          add(DisplayHomeCategories(state.response.categories));
        }
      },
    );
  }

  @override
  Stream<HomeCategoriesState> mapEventToState(
      HomeCategoriesEvent event) async* {
    if (event is DisplayHomeCategories) {
      yield* _mapDisplayHomeCategoriesToState(event.categories);
    }
  }

  Stream<HomeCategoriesState> _mapDisplayHomeCategoriesToState(
      List<Categoryy> categories) async* {
    yield HomeCategoriesLoaded(categories);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
