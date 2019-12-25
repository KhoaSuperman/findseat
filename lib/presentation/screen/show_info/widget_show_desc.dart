import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetShowDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.WHITE,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: _buildShowName_Date(),
              ),
              Expanded(
                flex: 1,
                child: _buildLike_Votes(),
              ),
            ],
          ),
          WidgetSpacer(height: 12),
          _buildTagList(),
          WidgetSpacer(height: 10),
          _buildExtraInfo(),
        ],
      ),
    );
  }

  _buildShowName_Date() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Black Panther - The King', style: FONT_CONST.MEDIUM_BLACK2_16),
        WidgetSpacer(height: 6),
        Text('UA | Oct 15, 2019', style: FONT_CONST.REGULAR_GRAY4_12)
      ],
    );
  }

  _buildLike_Votes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.favorite,
                size: 20,
                color: COLOR_CONST.DEFAULT,
              ),
            ),
            Text('98%', style: FONT_CONST.MEDIUM_BLACK2_16)
          ],
        ),
        WidgetSpacer(height: 6),
        Text('1.8k votes', style: FONT_CONST.REGULAR_DEFAULT_10)
      ],
    );
  }

  _buildTagList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Tami', style: FONT_CONST.REGULAR_DEFAULT_12),
        WidgetSpacer(width: 10),
        _buildTag('3D'),
        WidgetSpacer(width: 6),
        _buildTag('2D'),
      ],
    );
  }

  _buildTag(String tag) {
    return Container(
      child: Center(child: Text(tag, style: FONT_CONST.REGULAR_DEFAULT_12)),
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 3),
      decoration: BoxDecoration(
          color: COLOR_CONST.TAG_BG,
          borderRadius: BorderRadius.circular(3),
          shape: BoxShape.rectangle),
    );
  }

  _buildExtraInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        MySvgImage(
          width: 10,
          height: 10,
          color: COLOR_CONST.GRAY1,
          path: 'assets/ic_clock_line.svg',
        ),
        WidgetSpacer(width: 6),
        Text('2h 59m', style: FONT_CONST.REGULAR_GRAY1_10),
        WidgetSpacer(width: 9),
        MySvgImage(
          width: 10,
          height: 10,
          path: 'assets/ic_plays_line.svg',
          color: COLOR_CONST.GRAY1,
        ),
        WidgetSpacer(width: 6),
        Text('Action, Drama', style: FONT_CONST.REGULAR_GRAY1_10),
      ],
    );
  }
}
