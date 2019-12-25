import 'package:find_seat/presentation/screen/show_info/barrel_show_info.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class ShowInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: <Widget>[
                WidgetShowTrailer(),
                WidgetShowDesc(),
                WidgetOffers(),
                WidgetShowReview(),
                WidgetShowCasts(),
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
      child: Placeholder(
        color: COLOR_CONST.DEFAULT,
        fallbackHeight: 54,
      ),
    );
  }
}
