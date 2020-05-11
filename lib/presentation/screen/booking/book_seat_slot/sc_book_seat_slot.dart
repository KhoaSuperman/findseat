import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/common_widgets/widget_toolbar.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/payment_method_picker/barrel_payment_method_picker.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenArguments {
  int seatCount;
  SEAT_TYPE seatType;

  ScreenArguments({
    this.seatCount,
    this.seatType,
  });

  @override
  String toString() {
    return 'ScreenArguments{seatCount: $seatCount, seatType: $seatType}';
  }
}

class BookSeatSlotScreen extends StatefulWidget {
  ScreenArguments args;

  BookSeatSlotScreen({this.args});

  @override
  _BookSeatSlotScreenState createState() => _BookSeatSlotScreenState();
}

class _BookSeatSlotScreenState extends State<BookSeatSlotScreen> {
  ItemCineTimeSlot _itemCineTimeSlot;

  @override
  void initState() {
    print(widget.args);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<BookSeatSlotBloc>(
          create: (context) => BookSeatSlotBloc(
            sessionRepository:
                RepositoryProvider.of<SessionRepository>(context),
            seatSlotRepository:
                RepositoryProvider.of<SeatSlotRepository>(context),
            selectedSeatType: widget.args.seatType,
            seatCount: widget.args.seatCount,
          )..add(OpenScreen()),
          child: BlocConsumer<BookSeatSlotBloc, BookSeatSlotState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state.show != null &&
                  state.bookTimeSlot != null &&
                  state.itemGridSeatSlotVMs.isNotEmpty) {
                BookTimeSlot bookTimeSlot = state.bookTimeSlot;
                int selectedIndex =
                    bookTimeSlot.timeSlots.indexOf(state.selectedTimeSlot);
                String showName = state.show.name;

                _itemCineTimeSlot = ItemCineTimeSlot.fromBookTimeSlot(
                    bookTimeSlot: bookTimeSlot);

                return Container(
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          WidgetToolbar(
                            title: showName,
                            actions: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 20),
                              child: Text('2 seats',
                                  style: FONT_CONST.MEDIUM_WHITE_12),
                            ),
                          ),
                          WidgetCineTimeSlot.selected(
                            item: _itemCineTimeSlot,
                            selectedIndex: selectedIndex,
                            showCineName: false,
                            showCineDot: false,
                          ),
                          WidgetCineScreen(),
                          _buildListItemGridSeatSlot(state),
                          WidgetSpacer(height: 64),
                        ],
                      ),
                    ),
                    _buildBtnPay(),
                  ]),
                );
              }

              if (state.isLoading) {
                return WidgetLoading();
              }

              if (state.msg != null) {
                return WidgetScreenMessage(msg: state.msg);
              }

              return WidgetEmpty();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListItemGridSeatSlot(BookSeatSlotState state) {
    List<Widget> widgets = [];

    state.itemGridSeatSlotVMs.forEach(
      (itemGridSeatSlotVM) {
        widgets.add(
          WidgetItemGridSeatSlot(itemGridSeatSlotVM: itemGridSeatSlotVM),
        );
        widgets.add(
          WidgetSpacer(height: 14),
        );
      },
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
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
}
