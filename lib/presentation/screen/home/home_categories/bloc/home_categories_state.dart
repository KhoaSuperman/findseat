import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/categoryy.dart';

class HomeCategoriesState extends Equatable {
  const HomeCategoriesState();

  @override
  List<Object> get props => [];
}

class HomeCategoriesLoaded extends HomeCategoriesState {
  final List<Categoryy> categories;

  HomeCategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];

  @override
  String toString() {
    return 'HomeCategoriesLoaded{categories: $categories}';
  }
}

class HomeCategoriesNotLoaded extends HomeCategoriesState {}
