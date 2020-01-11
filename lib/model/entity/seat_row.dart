import 'package:flutter/cupertino.dart';

class SeatRow {
  //A, B, C, ...
  String rowId;
  int count;
  List<int> offs = [];
  List<int> booked = [];

  SeatRow({
    @required this.rowId,
    @required this.count,
    @required this.offs,
    @required this.booked,
  });
}
