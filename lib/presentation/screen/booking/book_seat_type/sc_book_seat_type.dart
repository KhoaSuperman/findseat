import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_type/barrel_book_seat_type.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  Cine cine;
  TimeSlot selectedTimeSlot;
  List<TimeSlot> timeSlots;

  ScreenArguments({
    @required this.cine,
    @required this.selectedTimeSlot,
    @required this.timeSlots,
  });
}

class BookSeatTypeScreen extends StatefulWidget {
  ScreenArguments args;

  BookSeatTypeScreen(this.args);

  @override
  _BookSeatTypeScreenState createState() => _BookSeatTypeScreenState();
}

class _BookSeatTypeScreenState extends State<BookSeatTypeScreen> {
  ScreenArguments args;

  ItemCineTimeSlot _itemCineTimeSlot;

  @override
  void initState() {
    args = widget.args;

    _itemCineTimeSlot = ItemCineTimeSlot(
      cine: args.cine,
      textLocation: args.cine.address,
      textDistance: '',
      timeSlots: args.timeSlots
          .map((timeSlot) => ItemTimeSlot.fromTimeSlot(timeSlot: timeSlot))
          .toList(),
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
                      selectedIndex: args.timeSlots.indexOf(args.selectedTimeSlot),
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
