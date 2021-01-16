import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/viewmodel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_seat_slot_state.freezed.dart';

@freezed
abstract class BookSeatSlotState with _$BookSeatSlotState {
  const factory BookSeatSlotState({
    Show show,
    TimeSlot selectedTimeSlot,
    BookTimeSlot bookTimeSlot,
    //
    @Default(false) bool isLoading,
    List<ItemGridSeatSlotVM> itemGridSeatSlotVMs,
    String msg,
    //
    @Default(false) bool isSelectWrongSeatType,
    @Default(false) bool isReachedLimitSeatSlot,
    //
    List<String> selectedSeatIds,
    @Default(0) double totalPrice,
    //
    @Default(false) bool isOpenPaymentMethod,
  }) = _BookSeatSlotState;
}
