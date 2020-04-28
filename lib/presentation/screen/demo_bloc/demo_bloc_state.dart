import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'demo_bloc_state.freezed.dart';

@freezed
abstract class DemoBlocState with _$DemoBlocState {
  const factory DemoBlocState({
    @Default(false) bool isLoading,
    List<String> list,
    String msg,
  }) = _DemoBlocState;
}
