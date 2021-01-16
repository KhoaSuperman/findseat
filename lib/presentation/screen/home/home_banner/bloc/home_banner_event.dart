import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:find_seat/model/entity/entity.dart';

class HomeBannerEvent extends Equatable {
  const HomeBannerEvent();

  @override
  List<Object> get props => [];
}

class DisplayHomeBanner extends HomeBannerEvent {
  final List<Banner> banners;

  DisplayHomeBanner({@required this.banners});

  @override
  List<Object> get props => [banners];
}
