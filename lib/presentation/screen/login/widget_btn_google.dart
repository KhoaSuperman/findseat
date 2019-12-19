import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetBtnGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: COLOR_CONST.GOOGLE_BTN,
            border: Border.all(
              width: 0.2,
              color: COLOR_CONST.GOOGLE_BORDER_BTN,
            ),
            shape: BoxShape.rectangle),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: SvgPicture.asset(
                'assets/ic_google.svg',
                width: 24,
                height: 24,
              ),
            ),
            Text(
              'Google',
              style: FONT_CONST.REGULAR_GRAY4_12,
            )
          ],
        ),
      ),
    );
  }
}
