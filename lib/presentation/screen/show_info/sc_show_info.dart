import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
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
                WidgetSpacer(height: 14),
                WidgetOffers(),
                WidgetSpacer(height: 14),
                WidgetShowReview(),
                WidgetSpacer(height: 14),
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
