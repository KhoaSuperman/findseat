import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
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
        body: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    WidgetCineTimeSlot(_itemCineTimeSlot),
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
      child: Placeholder(
        fallbackHeight: 56,
      ),
    );
  }
}
