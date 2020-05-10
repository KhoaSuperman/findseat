import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'seat_type.g.dart';

@JsonSerializable()
class SeatType extends Equatable {
  String name;
  double price;
  @JsonKey(name: "seat_type")
  SEAT_TYPE type;

  @JsonKey(name: "seat_rows")
  List<SeatRow> seatRows;

  SeatType(this.name, this.price, this.type, [this.seatRows]);

  factory SeatType.fromJson(Map<String, dynamic> json) =>
      _$SeatTypeFromJson(json);

  Map<String, dynamic> toJson() => _$SeatTypeToJson(this);

  @override
  List<Object> get props => [type];

  @override
  String toString() {
    return 'SeatType{name: $name}';
  }

  static final List<SeatType> SAMPLE_DATA = [
    SeatType('King', 120.0, SEAT_TYPE.KING),
    SeatType('Queen', 100.0, SEAT_TYPE.QUEEN),
    SeatType('Jack', 80.0, SEAT_TYPE.JACK),
  ];
}

enum SEAT_TYPE { KING, QUEEN, JACK }
