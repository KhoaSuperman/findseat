import 'package:find_seat/model/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_seat_slot_state.freezed.dart';

@freezed
abstract class BookSeatSlotState with _$BookSeatSlotState {
  const factory BookSeatSlotState({
    Show show,
    TimeSlot selectedTimeSlot,
    BookTimeSlot bookTimeSlot,
  }) = _BookSeatSlotState;
}
