import 'package:equatable/equatable.dart';
import 'package:find_seat/model/api/response/api_response.dart';
import 'package:meta/meta.dart';

class HomeShowsCategoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayShowsByCategory extends HomeShowsCategoryEvent {
  final HomeResponse homeResponse;

  DisplayShowsByCategory(this.homeResponse);

  @override
  List<Object> get props => [homeResponse];

  @override
  String toString() {
    return 'DisplayShowsByCategory{homeResponse: $homeResponse}';
  }
}
