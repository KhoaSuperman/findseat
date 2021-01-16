import 'package:equatable/equatable.dart';

abstract class DemoBlocEvent extends Equatable {
  const DemoBlocEvent();
}

class OpenScreen extends DemoBlocEvent {
  @override
  List<Object> get props => [];
}

class SearchQueryChanged extends DemoBlocEvent {
  String keyword;

  SearchQueryChanged({this.keyword});

  @override
  List<Object> get props => [keyword];
}
