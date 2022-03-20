import 'package:equatable/equatable.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:meta/meta.dart';

class ItemSeatSlotVM extends Equatable {
  String seatId;
  bool isOff;
  bool isBooked;
  bool isSelected;
  SEAT_TYPE seatType;

  ItemSeatSlotVM({
    required this.seatId,
    required this.isOff,
    required this.isBooked,
    required this.isSelected,
    required this.seatType,
  });

  @override
  List<Object> get props => [seatId, isSelected, seatType];

  @override
  String toString() {
    return 'ItemSeatSlotVM{seatId: $seatId}';
  }
}
