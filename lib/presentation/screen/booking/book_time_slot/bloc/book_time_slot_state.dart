import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:equatable/equatable.dart';

part 'book_time_slot_state.freezed.dart';

@freezed
abstract class BookTimeSlotState with _$BookTimeSlotState {
  const factory BookTimeSlotState({
    @Default(false) bool isLoading,
    List<BookTimeSlot> list,
    String msg,
    @Default(false) bool showSearchField,
    TakeOutValue<bool> navigatorEvent,
  }) = _BookTimeSlotState;
}

class TakeOutValue<T> extends Equatable {
  T _value;

  T get value {
    final oldValue = _value;
//    _value = null;
    return oldValue;
  }

  set value(T value) {
    _value = value;
  }

  @override
  List<Object> get props => [_value];

  @override
  String toString() {
    return 'TakeOutValue{_value: $_value}';
  }
}
