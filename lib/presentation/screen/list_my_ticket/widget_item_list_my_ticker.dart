import 'package:find_seat/model/entity/ticket.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/COLOR_CONST.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/material.dart';
import 'package:find_seat/utils/my_formatter.dart';
import 'package:dotted_border/dotted_border.dart';

class WidgetItemListMyTicker extends StatelessWidget {
  final double itemHeight = 148;

  Ticket ticket;

  WidgetItemListMyTicker(this.ticket);

  @override
  Widget build(BuildContext context) {
    String banner = ticket.showBanner;
    String showName = ticket.showName;
    String timeSlot = ticket.showTimeSlot;
    String bookTime = (ticket.bookTime ~/ 1000).MMM_dd_yyyy();
    String cineName = ticket.cineName;

    //
    List<String> seatSlots = ticket.seat.split(";");
    String strSeatSlot = seatSlots[0];
    seatSlots.skip(1).forEach((element) {
      int index = seatSlots.indexOf(element);
      if (index % 2 == 0) {
        strSeatSlot = "$strSeatSlot\n$element";
      } else {
        strSeatSlot = "$strSeatSlot, $element";
      }
    });

    return Container(
      color: COLOR_CONST.WHITE,
      height: itemHeight,
      child: Row(
        children: [
          Image.network(
            banner,
            width: 108,
            height: itemHeight,
            fit: BoxFit.cover,
          ),
          WidgetSpacer(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  showName,
                  style: FONT_CONST.MEDIUM_BLACK2_16.copyWith(fontSize: 16),
                ),
                WidgetSpacer(height: 2),
                Text(
                  timeSlot,
                  style: FONT_CONST.MEDIUM.copyWith(fontSize: 14),
                ),
                WidgetSpacer(height: 2),
                Text(
                  cineName,
                  style: FONT_CONST.MEDIUM
                      .copyWith(color: COLOR_CONST.GRAY6, fontSize: 10),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 4),
            child: Container(
              width: 2,
              color: COLOR_CONST.ITEM_BG,
            ),
          ),
          Container(
            width: 76,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Seat", style: FONT_CONST.REGULAR_BLACK2_12),
                WidgetSpacer(height: 4),
                Text(
                  strSeatSlot,
                  style: FONT_CONST.OSWALD_REGULAR.copyWith(
                    color: COLOR_CONST.DEFAULT,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
