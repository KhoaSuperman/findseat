import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/sort_show.dart';
import 'package:meta/meta.dart';

class AllShowsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OpenScreen extends AllShowsEvent {}

class ClickIconSearch extends AllShowsEvent {}

class ClickCloseSearch extends AllShowsEvent {}

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

class ClickIconSort extends AllShowsEvent {
  @override
  List<Object> get props => [DateTime.now().millisecond];
}

class SortByChanged extends AllShowsEvent {
  SHOW_SORT_BY showSortBy;

  SortByChanged(this.showSortBy);

  @override
  List<Object> get props => [showSortBy];

  @override
  String toString() {
    return 'SortByChanged{showSortBy: $showSortBy}';
  }
}
