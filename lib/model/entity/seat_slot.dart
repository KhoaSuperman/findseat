import 'package:flutter/cupertino.dart';

class SeatSlot {
  int slotId;
  String rowId;
  bool isBooked;

  SeatSlot(
      {@required this.slotId, @required this.rowId, @required this.isBooked});
}
