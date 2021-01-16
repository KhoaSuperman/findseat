import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/categoryy.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:meta/meta.dart';

class HomeShowsCategoryState extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowsByCategoryNotLoaded extends HomeShowsCategoryState {}

class ShowsByCategoryLoaded extends HomeShowsCategoryState {
  final List<MapEntry<Categoryy, List<Show>>> list;

  ShowsByCategoryLoaded({@required this.list});

  @override
  List<Object> get props => [list];
}
