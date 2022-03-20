import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'payment_method_picker_state.freezed.dart';

@freezed
abstract class PaymentMethodPickerState with _$PaymentMethodPickerState {
  const factory PaymentMethodPickerState({
    @Default(true) bool isLoading,
    @Default(false) bool isComplete,
    String? msg,
  }) = _PaymentMethodPickerState;
}
