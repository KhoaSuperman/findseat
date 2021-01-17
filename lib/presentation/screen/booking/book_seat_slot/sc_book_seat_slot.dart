import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/common_widgets/widget_toolbar.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/payment_method_picker/sc_payment_method_picker.dart';
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

  BuildContext _blocContext;

  get bloc => BlocProvider.of<BookSeatSlotBloc>(_blocContext);

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
            listener: (context, state) {
              _handleBlocListener(context, state);
            },
            builder: (context, state) {
              _blocContext = context;

              if (state.show != null &&
                  state.bookTimeSlot != null &&
                  state.itemGridSeatSlotVMs.isNotEmpty) {
                BookTimeSlot bookTimeSlot = state.bookTimeSlot;
                int selectedIndex =
                    bookTimeSlot.timeSlots.indexOf(state.selectedTimeSlot);
                String showName = state.show.name;

                _itemCineTimeSlot = ItemCineTimeSlot.fromBookTimeSlot(
                    bookTimeSlot: bookTimeSlot);

                String textSeat = state.selectedSeatIds != null
                    ? '${state.selectedSeatIds.length} seats'
                    : '0 seat';

                return Container(
                  child: Stack(fit: StackFit.expand, children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        WidgetToolbar(
                          title: showName,
                          actions:
                              Text(textSeat, style: FONT_CONST.MEDIUM_WHITE_12),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
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
                        )
                      ],
                    ),
                    _buildBtnPay(state),
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

  _buildBtnPay(BookSeatSlotState state) {
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
              Text(
                  'Pay${state.totalPrice > 0 ? " \$ ${state.totalPrice}" : ""}',
                  style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: () {
            bloc.add(ClickButtonPay());
          },
        ),
      ),
    );
  }

  void _handleBlocListener(BuildContext context, BookSeatSlotState state) {
    if (state.isReachedLimitSeatSlot) {
      MySnackBar.failure(context,
          msg: "You reached ${widget.args.seatCount} seats");
      bloc.add(DismissMessageReachedLimitSeatSlot());
    }

    if (state.isSelectWrongSeatType) {
      MySnackBar.failure(context,
          msg: "Please select seat ${widget.args.seatType.toText()}");
      bloc.add(DismissMessageWrongSeatType());
    }

    if (state.isOpenPaymentMethod) {
      bloc.add(OpenedPaymentMethodScreen());

      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (context) {
          return PaymentMethodPickerScreen(
            state.selectedSeatIds,
            state.totalPrice,
            state.show,
            state.selectedTimeSlot,
            state.bookTimeSlot,
          );
        },
      );
    }
  }
}
