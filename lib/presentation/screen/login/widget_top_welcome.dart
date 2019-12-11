import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetTopWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        WidgetSpacer(height: 41),
        SizedBox(
          width: 172,
          child: WidgetLogoFindSeat(),
        ),
        WidgetSpacer(height: 40),
        Text('Welcome Buddies', style: FONT_CONST.MEDIUM_WHITE_22),
        Text(' Login to book your seat, I said its your seat',
            style: FONT_CONST.MEDIUM_WHITE_14),
        WidgetSpacer(height: 30),
      ],
    );
  }
}
