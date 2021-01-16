import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';

class RecommendedSeatsEvent extends Equatable {
  const RecommendedSeatsEvent();

  @override
  List<Object> get props => [];
}

class DisplayRecommendedSeats extends RecommendedSeatsEvent {
  final List<Show> shows;

  DisplayRecommendedSeats(this.shows);

  @override
  List<Object> get props => [shows];

  @override
  String toString() {
    return 'DisplayRecommendedSeats{shows: $shows}';
  }
}
