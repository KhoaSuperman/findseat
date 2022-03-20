import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_seat/model/entity/banner.dart';
import 'package:meta/meta.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/home_banner/bloc/bloc.dart';

class HomeBannerBloc extends Bloc<HomeBannerEvent, HomeBannerState> {
  final HomeBloc homeBloc;
  late StreamSubscription subscription;

  HomeBannerBloc({required this.homeBloc}) : super(HomeBannerNotLoaded()) {
    subscription = homeBloc.stream.listen(
      (state) {
        if (state is HomeLoaded) {
          add(DisplayHomeBanner(banners: state.response.banners));
        }
      },
    );
  }

  @override
  HomeBannerState get initialState => HomeBannerNotLoaded();

  @override
  Stream<HomeBannerState> mapEventToState(HomeBannerEvent event) async* {
    if (event is DisplayHomeBanner) {
      yield* _mapDisplayHomeBannerToState(event.banners);
    }
  }

  Stream<HomeBannerState> _mapDisplayHomeBannerToState(
      List<Banner> banners) async* {
    yield HomeBannerLoaded(banners: banners);
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
