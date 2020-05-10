import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ItemSeatSlotVM extends Equatable {
  String seatId;
  bool isOff;
  bool isBooked;
  bool isSelected;

  ItemSeatSlotVM({
    @required this.seatId,
    @required this.isOff,
    @required this.isBooked,
    @required this.isSelected,
  });

  @override
  List<Object> get props => [seatId, isSelected];

  @override
  String toString() {
    return 'ItemSeatSlotVM{seatId: $seatId}';
  }
}
