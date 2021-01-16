import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class DemoBlocBloc extends Bloc<DemoBlocEvent, DemoBlocState> {
  static List<String> SAMPLE_DATA = ["Hello", "world", "this", "is", "demo"];
  static List<String> SAMPLE_FILTERED = ["world", "is"];

  @override
  DemoBlocState get initialState => DemoBlocState(isLoading: true);

  @override
  Stream<DemoBlocState> mapEventToState(
    DemoBlocEvent event,
  ) async* {
    if (event is OpenScreen) {
      yield* _mapOpenScreenToState();
    } else if (event is SearchQueryChanged) {
      yield* _mapSearchQueryChangedToState(event.keyword);
    }
  }

  Stream<DemoBlocState> _mapOpenScreenToState() async* {
    try {
      yield state.copyWith(
        isLoading: false,
        list: SAMPLE_DATA,
      );
    } catch (e, s) {
      print(s);
    }
  }

  Stream<DemoBlocState> _mapSearchQueryChangedToState(String keyword) async* {
    try {
      yield state.copyWith(isLoading: true);

      yield state.copyWith(
        isLoading: false,
        list: SAMPLE_FILTERED,
      );
    } catch (e, s) {
      print(s);
    }
  }
}
