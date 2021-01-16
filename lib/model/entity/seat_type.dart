import 'package:find_seat/model/api/json_converter.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'seat_type.g.dart';

@JsonSerializable()
class SeatType extends Equatable {
  String name;

  @StringAsDoubleConverter()
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
    SeatType('King', 120.0, SEAT_TYPE.KING, SeatRow.SAMPLE_KING),
    SeatType('Queen', 100.0, SEAT_TYPE.QUEEN, SeatRow.SAMPLE_QUEEN),
    SeatType('Jack', 80.0, SEAT_TYPE.JACK, SeatRow.SAMPLE_JACK),
  ];
}

//rename to SEAT_SLOT_TYPE
enum SEAT_TYPE {
  @JsonValue("king")
  KING,
  @JsonValue("queen")
  QUEEN,
  @JsonValue("jack")
  JACK,
}

extension SEAT_TYPE_toText on SEAT_TYPE {
  String toText() {
    switch (this) {
      case SEAT_TYPE.JACK:
        return "Jack";
      case SEAT_TYPE.QUEEN:
        return "Queen";
      case SEAT_TYPE.KING:
        return "King";
      default:
        return "Undefined";
    }
  }
}
