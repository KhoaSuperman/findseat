import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/presentation/common_widgets/widget_toolbar.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class BookSeatSlotScreen extends StatefulWidget {
  @override
  _BookSeatSlotScreenState createState() => _BookSeatSlotScreenState();
}

class _BookSeatSlotScreenState extends State<BookSeatSlotScreen> {
  ItemCineTimeSlot _itemCineTimeSlot;

  @override
  void initState() {
    _itemCineTimeSlot = ItemCineTimeSlot(
        'Arasan Cinemas A/C 2K Dolby', 'Friday, Nov 14, 2019', '', [
      ItemTimeSlot('10:00 AM', 10, true),
      ItemTimeSlot('1:30 PM', 13, true),
      ItemTimeSlot('6:30 PM', 6, true),
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              WidgetToolbar(
                title: 'Black Panther',
                actions: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                  child: Text('2 seats', style: FONT_CONST.MEDIUM_WHITE_12),
                ),
              ),
              WidgetCineTimeSlot.selected(
                item: _itemCineTimeSlot,
                selectedIndex: 0,
                showCineName: false,
                showCineDot: false,
              ),
              WidgetCineScreen(),
              WidgetItemGridSeatSlot(),
            ],
          ),
        ),
      ),
    );
  }
}
