import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_time_slot_by_cine_response.g.dart';

@JsonSerializable()
class BookingTimeSlotByCineResponse {
  String id;
  Cine cine;
  List<String> tami;

  @JsonKey(name: "time_slots")
  List<TimeSlot> timeSlots;

  BookingTimeSlotByCineResponse(
      {this.id, this.cine, this.tami, this.timeSlots});

  factory BookingTimeSlotByCineResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingTimeSlotByCineResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BookingTimeSlotByCineResponseToJson(this);
}
