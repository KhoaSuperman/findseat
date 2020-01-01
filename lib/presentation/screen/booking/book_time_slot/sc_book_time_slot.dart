import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/cine_date_picker/barrel_cine_date_picker.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class BookTimeSlotScreen extends StatelessWidget {
  List<ItemCineTimeSlot> items = [
    ItemCineTimeSlot(
      'Arasan Cinemas A/C 2K Dolby',
      'Coimbatore',
      '2.4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, true),
        ItemTimeSlot('9:30 PM', 21, true),
        ItemTimeSlot('12:30 AM', 0, true),
      ],
    ),
    ItemCineTimeSlot(
      'INOX - Prozone mall',
      'Coimbatore',
      '3.2 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, false),
      ],
    ),
    ItemCineTimeSlot(
      'Karpagam theatres - 4K Dolby Atoms',
      'Coimbatore',
      '4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
      ],
    ),
    ItemCineTimeSlot(
      'KG theatres - 4K',
      'Coimbatore',
      '4.4 miles away',
      [
        ItemTimeSlot('10:00 AM', 10, true),
        ItemTimeSlot('1:30 PM', 13, true),
        ItemTimeSlot('6:30 PM', 6, true),
      ],
    )
  ];

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              WidgetToolbar.defaultActions(title: 'Black Panther'),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    _buildListCineTimeSlot(),
                    _buildBtnToday(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildListCineTimeSlot() {
    return ListView.separated(
      itemBuilder: (context, index) {
        if (index < items.length) {
          var item = items[index];
          return WidgetCineTimeSlot(item);
        } else {
          return WidgetSpacer(height: 55);
        }
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(
          height: 14,
        );
      },
      itemCount: items.length + 1,
      physics: BouncingScrollPhysics(),
    );
  }

  _buildBtnToday() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 56,
        padding: EdgeInsets.only(left: 20),
//        width: MediaQuery.of(_context).size.width,
        color: COLOR_CONST.BLUE,
        child: Row(
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  openCineDatePicker();
                },
                child: Row(
                  children: <Widget>[
                    Icon(Icons.calendar_today,
                        color: COLOR_CONST.WHITE, size: 14),
                    WidgetSpacer(width: 6),
                    Text('Today, 14 NOV', style: FONT_CONST.REGULAR_WHITE_14),
                    WidgetSpacer(width: 4),
                    Icon(Icons.keyboard_arrow_down,
                        color: COLOR_CONST.WHITE, size: 12)
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Text('Tamil, 3D', style: FONT_CONST.REGULAR_WHITE_14),
                  WidgetSpacer(width: 4),
                  Icon(Icons.keyboard_arrow_down,
                      color: COLOR_CONST.WHITE, size: 10)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void openCineDatePicker() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: _context,
      builder: (context) {
        return CineDatePickerScreen();
      },
    );
  }
}

class ItemCineTimeSlot {
  String cineName;
  String textLocation;
  String textDistance;
  List<ItemTimeSlot> timeSlots;

  ItemCineTimeSlot(
      this.cineName, this.textLocation, this.textDistance, this.timeSlots);
}
