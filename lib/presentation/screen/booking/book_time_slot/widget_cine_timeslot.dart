import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/cine_location/barrel_cine_location.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetCineTimeSlot extends StatelessWidget {
  ItemCineTimeSlot item;
  int selectedIndex = -1;
  bool showCineName = true;
  bool showCineDot = true;

  WidgetCineTimeSlot(this.item);

  WidgetCineTimeSlot.selected({
    @required this.item,
    @required this.selectedIndex,
    @required this.showCineName,
    @required this.showCineDot,
  });

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 7),
      color: COLOR_CONST.WHITE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          showCineName
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child:
                          Text(item.cineName, style: FONT_CONST.MEDIUM_BLUE_14),
                    ),
                    GestureDetector(
                      onTap: () {
                        _openCineLocation();
                      },
                      child:
                          Icon(Icons.info_outline, color: COLOR_CONST.GRAY1_50),
                    ),
                  ],
                )
              : Container(),
          WidgetSpacer(height: 4),
          Row(
            children: <Widget>[
              showCineDot
                  ? MySvgImage(
                      path: 'assets/ic_cine_dot.svg',
                      width: 9.94,
                      height: 12,
                      color: COLOR_CONST.GRAY1,
                    )
                  : Container(),
              WidgetSpacer(width: showCineDot ? 7 : 0),
              Text(item.textLocation, style: FONT_CONST.REGULAR_GRAY1_12),
              WidgetSpacer(width: 11),
              Text(item.textDistance, style: FONT_CONST.REGULAR_BLACK2_10),
            ],
          ),
          WidgetSpacer(height: 16),
          Wrap(
            children: <Widget>[
              for (final timeSlot in item.timeSlots)
                _WidgetTimeSlot(
                    timeSlot,
                    item.timeSlots.indexOf(timeSlot) == selectedIndex,
                    selectedIndex != -1)
            ],
          )
        ],
      ),
    );
  }

  _openCineLocation() {
    showModalBottomSheet(
      context: _context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return CineLocationScreen();
      },
    );
  }
}

class _WidgetTimeSlot extends StatelessWidget {
  ItemTimeSlot item;
  bool isSelected;
  bool isSmallMode;

  _WidgetTimeSlot(this.item, this.isSelected, this.isSmallMode);

  @override
  Widget build(BuildContext context) {
    var itemWidth = 99.0;
    var itemHeight = 40.0;
    var fontSize = 14.0;
    var textPaddingHoz = 10.0;

    var textStyle = FONT_CONST.REGULAR_BLACK2_14;
    var timeColor = item.hour % 2 == 0 ? COLOR_CONST.GREEN : COLOR_CONST.ORANGE;
    if (!item.active) {
      timeColor = COLOR_CONST.TIME_SLOT_BORDER;
    }

    var itemBg = isSelected ? COLOR_CONST.GREEN : COLOR_CONST.TIME_SLOT_BG;
    var itemBorder =
        isSelected ? Colors.transparent : COLOR_CONST.TIME_SLOT_BORDER;

    if (isSelected) {
      timeColor = COLOR_CONST.WHITE;
      textStyle = FONT_CONST.MEDIUM_WHITE_14;
    }

    if (isSmallMode) {
      itemWidth = 84.0;
      itemHeight = 35.0;
      fontSize = 12.0;
    }

    return GestureDetector(
      onTap: () {
        if (!isSmallMode) {
          Navigator.pushNamed(context, Router.BOOK_SEAT_TYPE);
        }
      },
      child: Container(
        width: itemWidth,
        padding: EdgeInsets.symmetric(vertical: textPaddingHoz),
        margin: EdgeInsets.only(right: 13, bottom: 13),
        decoration: BoxDecoration(
            border: Border.all(
              color: itemBorder,
              width: 0.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: itemBg),
        child: Center(
          child: Text(
            item.time,
            style: textStyle.copyWith(color: timeColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}

class ItemTimeSlot {
  String time;
  int hour;
  bool active;
  bool selected;

  ItemTimeSlot(this.time, this.hour, this.active);
}
