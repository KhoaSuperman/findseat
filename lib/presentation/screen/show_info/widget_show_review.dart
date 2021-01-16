import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:find_seat/utils/my_formatter.dart';

class WidgetShowReview extends StatelessWidget {
  Show show;

  WidgetShowReview({this.show});

  @override
  Widget build(BuildContext context) {
    String textReviews = "${show.totalReviews.formatDecimalThousand()} reviews";
    String authorAvatar = show.latestReviews.avatar;
    String authorName = show.latestReviews.author;
    String content = show.latestReviews.content;
    String textDate = show.latestReviews.created.MMM_dd_yyyy();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(color: COLOR_CONST.WHITE),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                textReviews,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    authorAvatar,
                    width: 24,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
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
                        Text(authorName, style: FONT_CONST.MEDIUM_GRAY4_10),
                        WidgetSpacer(width: 6),
                        Text(textDate, style: FONT_CONST.REGULAR_GRAY1_50_9),
                      ],
                    ),
                    Text(content, style: FONT_CONST.REGULAR_GRAY4_10)
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
