import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_type/barrel_book_seat_type.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class BookSeatTypeScreen extends StatefulWidget {
  @override
  _BookSeatTypeScreenState createState() => _BookSeatTypeScreenState();
}

class _BookSeatTypeScreenState extends State<BookSeatTypeScreen> {
  ItemCineTimeSlot _itemCineTimeSlot;

  @override
  void initState() {
    _itemCineTimeSlot = ItemCineTimeSlot(
      cineName: 'Arasan Cinemas A/C 2K Dolby',
      textLocation: 'Friday, Nov 14, 2019',
      textDistance: '',
      timeSlots: [
        ItemTimeSlot(time: '10:00 AM', hour: 10, active: true),
        ItemTimeSlot(time: '1:30 PM', hour: 13, active: true),
        ItemTimeSlot(time: '6:30 PM', hour: 6, active: true),
      ],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    WidgetToolbar(title: 'Black Panther', actions: Container()),
                    WidgetCineTimeSlot.selected(
                      item: _itemCineTimeSlot,
                      selectedIndex: 0,
                      showCineName: true,
                      showCineDot: false,
                    ),
                    WidgetSpacer(height: 14),
                    WidgetHowManySeats(),
                  ],
                ),
              ),
              _buildBtnSelectSeat(),
            ],
          ),
        ),
      ),
    );
  }

  _buildBtnSelectSeat() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 54,
        child: FlatButton(
          color: COLOR_CONST.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Select seats', style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, Router.BOOK_SEAT_SLOT);
          },
        ),
      ),
    );
  }
}
