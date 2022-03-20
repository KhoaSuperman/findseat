import 'package:find_seat/model/entity/entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'book_seat_type_state.freezed.dart';

@freezed
abstract class BookSeatTypeState with _$BookSeatTypeState {
  const factory BookSeatTypeState({
    Show? show,
    TimeSlot? selectedTimeSlot,
    BookTimeSlot? bookTimeSlot,
    //
    @Default(2) int seatCount,
    @Default(SEAT_TYPE.KING) SEAT_TYPE selectedSeatType,
    @Default(false) bool isOpenBookSeatSlotScreen,
  }) = _BookSeatTypeState;
}
