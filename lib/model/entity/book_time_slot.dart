import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'book_time_slot.g.dart';

@JsonSerializable()
class BookTimeSlot extends Equatable {
  Cine cine;
  List<TimeSlot> timeSlots;
  List<String> tami;

  BookTimeSlot({
    required this.cine,
    required this.timeSlots,
    required this.tami,
  });

  factory BookTimeSlot.fromJson(Map<String, dynamic> json) =>
      _$BookTimeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$BookTimeSlotToJson(this);

  @override
  List<Object> get props => [cine, timeSlots, tami];

  @override
  String toString() {
    return 'BookTimeSlot{cine: $cine, timeSlots: $timeSlots, tami: $tami}';
  }
}
