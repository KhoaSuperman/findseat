import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';

class RecommendedSeatsState extends Equatable {
  const RecommendedSeatsState();

  @override
  List<Object> get props => [];
}

class RecommendedSeatsLoaded extends RecommendedSeatsState {
  final List<Show> shows;

  RecommendedSeatsLoaded(this.shows);

  @override
  List<Object> get props => shows;

  @override
  String toString() {
    return 'RecommendedSeatsLoaded{shows: $shows}';
  }
}

class RecommendedSeatsNotLoaded extends RecommendedSeatsState {}
