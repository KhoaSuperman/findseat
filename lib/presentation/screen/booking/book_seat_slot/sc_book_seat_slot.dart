import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/common_widgets/widget_toolbar.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'package:find_seat/presentation/screen/payment_method_picker/barrel_payment_method_picker.dart';
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
        body: Container(
          child: Stack(fit: StackFit.expand, children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  WidgetToolbar(
                    title: 'Black Panther',
                    actions: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 20),
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
                  WidgetItemGridSeatSlot(
                    seatTypeName: '\$ 80.0 JACK',
                    seatRows: seatRowsJack,
                  ),
                  WidgetSpacer(height: 14),
                  WidgetItemGridSeatSlot(
                    seatTypeName: '\$ 100.0 QUEEN',
                    seatRows: seatRowsQueen,
                  ),
                  WidgetSpacer(height: 14),
                  WidgetItemGridSeatSlot(
                    seatTypeName: '\$ 120.0 KING',
                    seatRows: seatRowsKing,
                  ),
                  WidgetSpacer(height: 64),
                ],
              ),
            ),
            _buildBtnPay(),
          ]),
        ),
      ),
    );
  }

  _buildBtnPay() {
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
              Text('Pay \$ 200.0', style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: () {
            _openPaymentMethod();
          },
        ),
      ),
    );
  }

  _openPaymentMethod() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return PaymentMethodPickerScreen();
      },
    );
  }

  List<SeatRow> seatRowsKing = [
    SeatRow(
      rowId: 'I',
      count: 11,
      offs: [4, 5],
      booked: [],
    ),
    SeatRow(
      rowId: 'J',
      count: 11,
      offs: [],
      booked: [],
    ),
  ];

  List<SeatRow> seatRowsQueen = [
    SeatRow(
      rowId: 'F',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 3],
    ),
    SeatRow(
      rowId: 'G',
      count: 11,
      offs: [4, 5],
      booked: [6, 7, 8],
    ),
    SeatRow(
      rowId: 'H',
      count: 11,
      offs: [],
      booked: [0, 1, 4, 5, 9, 10],
    ),
  ];

  List<SeatRow> seatRowsJack = [
    SeatRow(
      rowId: 'A',
      count: 11,
      offs: [4, 5],
      booked: [0, 1, 2, 3],
    ),
    SeatRow(
      rowId: 'B',
      count: 11,
      offs: [4, 5],
      booked: [1, 2, 6, 7],
    ),
    SeatRow(
      rowId: 'C',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'D',
      count: 11,
      offs: [4, 5],
      booked: [9, 10],
    ),
    SeatRow(
      rowId: 'E',
      count: 11,
      offs: [],
      booked: [2, 3, 4, 5, 6, 7],
    )
  ];
}
