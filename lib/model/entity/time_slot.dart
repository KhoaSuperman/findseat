import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:json_annotation/json_annotation.dart';

part 'time_slot.g.dart';

@JsonSerializable()
class TimeSlot extends Equatable {
  String id;
  String time;
  bool active;

  TimeSlot({this.id, this.time, this.active});

  int get hour => int.parse(time.split(":").first);

  factory TimeSlot.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotToJson(this);

  @override
  List<Object> get props => [id, time, active];

  @override
  String toString() {
    return 'TimeSlot{id: $id, time: $time, active: $active}';
  }
}
