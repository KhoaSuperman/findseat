import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/booking/barrel_booking.dart';
import 'package:find_seat/presentation/screen/cine_date_picker/barrel_cine_date_picker.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class BookTimeSlotScreen extends StatelessWidget {
  Show show;

  BookTimeSlotScreen({this.show});

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<BookTimeSlotBloc>(
          create: (context) => BookTimeSlotBloc(
            bookTimeSlotRepository:
                RepositoryProvider.of<BookTimeSlotRepository>(context),
            sessionRepo: RepositoryProvider.of<SessionRepository>(context),
          )..add(OpenScreen()),
          child: Container(
            child: Column(
              children: <Widget>[
                WidgetSearchSortToolbar(title: show.name),
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
      ),
    );
  }

  _buildListCineTimeSlot() {
    return BlocConsumer<BookTimeSlotBloc, BookTimeSlotState>(
      listener: (context, state) {
        if (state.isOpenBookSeatTypeScreen) {
          _openBookSeatTypeScreen();
        }
      },
      builder: (context, state) {
        _context = context;

        if (state.list != null) {
          return ListView.separated(
            itemBuilder: (context, index) {
              if (index < state.list.length) {
                BookTimeSlot bookTimeSlot = state.list[index];

                ItemCineTimeSlot item = ItemCineTimeSlot.fromBookTimeSlot(
                    bookTimeSlot: bookTimeSlot);

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
            itemCount: state.list.length + 1,
            physics: BouncingScrollPhysics(),
          );
        }

        if (state.isLoading) {
          return WidgetLoading();
        }

        if (state.msg != null) {
          return WidgetScreenMessage(msg: state.msg);
        }

        return WidgetUnknownState();
      },
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

  _openBookSeatTypeScreen() {
    BlocProvider.of<BookTimeSlotBloc>(_context).add(OpenedBookSeatTypeScreen());
    Navigator.pushNamed(_context, AppRouter.BOOK_SEAT_TYPE);
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
  BookTimeSlot bookTimeSlot;

  String cineName;
  Cine cine;
  String textLocation;
  String textDistance;
  List<ItemTimeSlot> timeSlots;

  ItemCineTimeSlot({
    this.cine,
    this.textLocation,
    this.textDistance,
    this.timeSlots,
  }) : this.cineName = cine.name;

  ItemCineTimeSlot.fromBookTimeSlot({this.bookTimeSlot}) {
    this.cine = bookTimeSlot.cine;
    this.timeSlots = bookTimeSlot.timeSlots
        .map((timeSlot) => ItemTimeSlot.fromTimeSlot(timeSlot: timeSlot))
        .toList();

    this.cineName = bookTimeSlot.cine.name;
    this.textLocation = bookTimeSlot.cine.address;
    this.textDistance = bookTimeSlot.cine.distance.toString();
  }
}
