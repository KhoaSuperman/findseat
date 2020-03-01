import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:find_seat/model/entity/entity.dart';

class HomeBannerState extends Equatable {
  const HomeBannerState();

  @override
  List<Object> get props => [];
}

class HomeBannerNotLoaded extends HomeBannerState {}

class HomeBannerLoaded extends HomeBannerState {
  final List<Banner> banners;

  HomeBannerLoaded({@required this.banners});

  @override
  List<Object> get props => [banners];
}
