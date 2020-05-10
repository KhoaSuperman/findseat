import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_seat_slot_by_seat_type_response.g.dart';

@JsonSerializable()
class ListSeatSlotBySeatTypeResponse {
  List<SeatType> data;

  ListSeatSlotBySeatTypeResponse(this.data);

  factory ListSeatSlotBySeatTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSeatSlotBySeatTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListSeatSlotBySeatTypeResponseToJson(this);
}
