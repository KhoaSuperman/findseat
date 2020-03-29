import 'package:equatable/equatable.dart';
import 'package:find_seat/presentation/screen/all_shows/bloc/all_shows_bloc.dart';
import 'package:meta/meta.dart';

class AllShowsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayListShows extends AllShowsState {
  Meta meta;

  DisplayListShows({this.meta});

  @override
  List<Object> get props => [meta];

  @override
  String toString() {
    return 'DisplayListShows{meta: $meta}';
  }
}

class LoadingData extends AllShowsState {}

class NoData extends AllShowsState {
  final String msg;

  NoData({this.msg});

  @override
  List<Object> get props => [msg];

  @override
  String toString() {
    return 'NoData{msg: $msg}';
  }
}
