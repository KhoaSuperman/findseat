import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetShowReview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(color: COLOR_CONST.WHITE),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                '1,403 reviews',
                style: FONT_CONST.MEDIUM_BLACK2_14,
              )),
              Expanded(
                  child: Text('Write yours >',
                      style: FONT_CONST.REGULAR_DEFAULT_10,
                      textAlign: TextAlign.right)),
            ],
          ),
          WidgetSpacer(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Image.asset(
                  'images/sample_reviewer.png',
                  width: 24,
                  height: 24,
                ),
              ),
              WidgetSpacer(width: 8),
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Mokka mohan', style: FONT_CONST.MEDIUM_GRAY4_10),
                        WidgetSpacer(width: 6),
                        Text('Nov 7, 2019',
                            style: FONT_CONST.REGULAR_GRAY1_50_9),
                      ],
                    ),
                    Text(
                        'With all the updates after the last few months the app has improved a lot. Keeps me up to date.',
                        style: FONT_CONST.REGULAR_GRAY4_10)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
