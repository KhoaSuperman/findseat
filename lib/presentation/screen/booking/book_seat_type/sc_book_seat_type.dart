import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/barrel_book_seat_slot.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_type/barrel_book_seat_type.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_type/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookSeatTypeScreen extends StatefulWidget {
  @override
  _BookSeatTypeScreenState createState() => _BookSeatTypeScreenState();
}

class _BookSeatTypeScreenState extends State<BookSeatTypeScreen> {
  BuildContext _blocContext;

  ItemCineTimeSlot _itemCineTimeSlot;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<BookSeatTypeBloc>(
        create: (context) => BookSeatTypeBloc(
          sessionRepository: RepositoryProvider.of<SessionRepository>(context),
        )..add(
            OpenScreen(),
          ),
        child: BlocConsumer<BookSeatTypeBloc, BookSeatTypeState>(
          listener: (context, state) {
            if (state.isOpenBookSeatSlotScreen) {
              _openBookSeatSlotScreen(state);
            }
          },
          builder: (context, state) {
            _blocContext = context;

            if (state.show != null && state.bookTimeSlot != null) {
              BookTimeSlot bookTimeSlot = state.bookTimeSlot;
              int selectedIndex =
                  bookTimeSlot.timeSlots.indexOf(state.selectedTimeSlot);
              String showName = state.show.name;

              _itemCineTimeSlot =
                  ItemCineTimeSlot.fromBookTimeSlot(bookTimeSlot: bookTimeSlot);

              return Scaffold(
                body: Container(
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          WidgetToolbar(
                              title: showName, actions: Container()),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  WidgetCineTimeSlot.selected(
                                    item: _itemCineTimeSlot,
                                    selectedIndex: selectedIndex,
                                    showCineName: true,
                                    showCineDot: false,
                                  ),
                                  WidgetSpacer(height: 14),
                                  WidgetHowManySeats(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      _buildBtnSelectSeat(),
                    ],
                  ),
                ),
              );
            }

            return WidgetEmpty();
          },
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
            BlocProvider.of<BookSeatTypeBloc>(_blocContext).add(ClickSelectSeats());
          },
        ),
      ),
    );
  }

  _openBookSeatSlotScreen(BookSeatTypeState state) {
    Navigator.pushNamed(context, AppRouter.BOOK_SEAT_SLOT,
        arguments: ScreenArguments(
          seatCount: state.seatCount,
          seatType: state.selectedSeatType,
        ));
    BlocProvider.of<BookSeatTypeBloc>(_blocContext).add(OpenedBookSeatSlotScreen());
  }
}
