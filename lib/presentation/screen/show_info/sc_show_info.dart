import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/show_info/barrel_show_info.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class ShowInfoScreen extends StatelessWidget {
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                WidgetShowTrailer(),
                WidgetShowDesc(),
                WidgetSpacer(height: 14),
                WidgetOffers(),
                WidgetSpacer(height: 14),
                WidgetShowReview(),
                WidgetSpacer(height: 14),
                WidgetShowCasts(),
                WidgetSpacer(height: 70),
              ],
            ),
            _buildBtnBookSeat(),
          ],
        ),
      ),
    );
  }

  _buildBtnBookSeat() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 54,
        child: FlatButton(
          color: COLOR_CONST.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySvgImage(
                width: 18.25,
                height: 16.1,
                path: 'assets/ic_sofa.svg',
              ),
              WidgetSpacer(width: 5),
              Text('Book seats', style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: () {
            openBookCineTimeSlot();
          },
        ),
      ),
    );
  }

  void openBookCineTimeSlot() {
    Navigator.pushNamed(_context, Router.BOOK_TIME_SLOT);
  }
}
