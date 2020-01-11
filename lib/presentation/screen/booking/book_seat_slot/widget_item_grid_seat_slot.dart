import 'dart:collection';

import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetItemGridSeatSlot extends StatefulWidget {
  List<SeatRow> seatRows = [
    SeatRow(
      rowId: 'A',
      count: 11,
      offs: [5, 6],
      booked: [0, 1, 2, 3],
    ),
    SeatRow(
      rowId: 'B',
      count: 11,
      offs: [5, 6],
      booked: [1, 2],
    ),
    SeatRow(
      rowId: 'C',
      count: 11,
      offs: [5, 6],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'D',
      count: 11,
      offs: [5, 6],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'E',
      count: 11,
      offs: [],
      booked: [2, 3, 4, 5, 6, 7, 8],
    )
  ];

  WidgetItemGridSeatSlot();

  @override
  _WidgetItemGridSeatSlotState createState() => _WidgetItemGridSeatSlotState();
}

class _WidgetItemGridSeatSlotState extends State<WidgetItemGridSeatSlot> {
  int maxColumn;
  HashMap<String, bool> selectedSeats = HashMap();

  @override
  void initState() {
    maxColumn = widget.seatRows[0].count + 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.WHITE,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$ 80.0 JACK', style: FONT_CONST.REGULAR_GRAY4_12),
          WidgetSpacer(height: 14),
          _buildSlotGrid(),
        ],
      ),
    );
  }

  _buildSlotGrid() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 129,
        maxHeight: 200,
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: maxColumn,
        scrollDirection: Axis.vertical,
        childAspectRatio: 1,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        children: _generatedGrid(),
      ),
    );
  }

  List<Widget> _generatedGrid() {
    List<Widget> widgets = [];

    widget.seatRows.forEach((seatRow) {
      //ITEM ROW NAME
      var itemRowName = Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${seatRow.rowId}',
            style: FONT_CONST.REGULAR_GRAY4_40_12,
          ),
        ),
      );

      widgets.add(itemRowName);

      //ITEM SEAT
      for (int i = 0; i < seatRow.count; i++) {
        var seatId = "${seatRow.rowId}$i";

        var isOff = seatRow.offs.contains(i);
        var isBooked = seatRow.booked.contains(i);
        var isSelected =
            selectedSeats.containsKey(seatId) && selectedSeats[seatId];

        var itemBgColor = COLOR_CONST.SEAT_SLOT_BG;
        var itemBorderColor = COLOR_CONST.SEAT_SLOT_BORDER;

        if (isBooked) {
          itemBgColor = COLOR_CONST.SEAT_SLOT_BG_BOOKED;
        }

        if (isSelected) {
          itemBgColor = COLOR_CONST.GREEN;
          itemBorderColor = COLOR_CONST.TRANS;
        }

        var itemAvailable = GestureDetector(
          onTap: () {
            if (!isBooked) {
              _handleSelectSeat(seatRow, seatId);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: itemBgColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: itemBorderColor,
                width: 1,
              ),
            ),
//            child: Center(child: Text('${seatRow.rowId}${i + 1}')),
          ),
        );

        var itemEmpty = Container();

        widgets.add(isOff ? itemEmpty : itemAvailable);
      }
    });

    return widgets;
  }

  void _handleSelectSeat(SeatRow seatRow, String seatId) {
    setState(() {
      if (!selectedSeats.containsKey(seatId)) {
        selectedSeats[seatId] = true;
      } else {
        selectedSeats[seatId] = !selectedSeats[seatId];
      }
    });
  }
}
