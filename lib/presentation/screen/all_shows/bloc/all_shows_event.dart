import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class AllShowsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OpenScreen extends AllShowsEvent {}

class SearchQueryChanged extends AllShowsEvent {
  final String keyword;

  SearchQueryChanged({this.keyword});

  @override
  List<Object> get props => [keyword];

  @override
  String toString() {
    return 'SearchQueryChanged{keyword: $keyword}';
  }
}
