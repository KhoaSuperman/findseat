import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:find_seat/utils/my_formatter.dart';


class WidgetShowDesc extends StatelessWidget {
  Show show;

  WidgetShowDesc({@required this.show});

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
    final name = show.name;
    final textDate = show.releaseDate.MMM_dd_yyyy();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(name, style: FONT_CONST.MEDIUM_BLACK2_16),
        WidgetSpacer(height: 6),
        Text(textDate, style: FONT_CONST.REGULAR_GRAY4_12)
      ],
    );
  }

  _buildLike_Votes() {

    final textRating = "${show.rate}%";
    final textVotes = show.votes;

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
            Text(textRating, style: FONT_CONST.MEDIUM_BLACK2_16)
          ],
        ),
        WidgetSpacer(height: 6),
        Text(textVotes, style: FONT_CONST.REGULAR_DEFAULT_10)
      ],
    );
  }

  _buildTagList() {
    final List<Widget> itemTamis = [];
    itemTamis.add(Text('Tami', style: FONT_CONST.REGULAR_DEFAULT_12));
    itemTamis.add(WidgetSpacer(width: 10));

    show.tami.forEach((tami){
      itemTamis.add(_buildTag(tami));
      itemTamis.add(WidgetSpacer(width: 6));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: itemTamis,
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
    //'2h 59m'
    final textDuration = Duration(seconds: show.duration).formatHHmm();
    final textTag = show.tags.join(", ").toString();

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
        Text(textDuration, style: FONT_CONST.REGULAR_GRAY1_10),
        WidgetSpacer(width: 9),
        MySvgImage(
          width: 10,
          height: 10,
          path: 'assets/ic_plays_line.svg',
          color: COLOR_CONST.GRAY1,
        ),
        WidgetSpacer(width: 6),
        Text(textTag, style: FONT_CONST.REGULAR_GRAY1_10),
      ],
    );
  }
}
