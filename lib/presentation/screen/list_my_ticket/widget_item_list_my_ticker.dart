import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/COLOR_CONST.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/material.dart';

class WidgetItemListMyTicker extends StatelessWidget {
  final double itemHeight = 148;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.WHITE,
      height: itemHeight,
      child: Row(
        children: [
          Image.network(
            "https://superman-academy.com/api/findseat/images/No Time to Die.jpg",
            height: itemHeight,
          ),
          WidgetSpacer(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No Time to Die',
                  style: FONT_CONST.MEDIUM_BLACK2_16.copyWith(fontSize: 18),
                ),
                WidgetSpacer(height: 4),
                Text(
                  '16:33 - 16 Jan 2020',
                  style: FONT_CONST.SEMIBOLD.copyWith(fontSize: 12),
                ),
                WidgetSpacer(height: 2),
                Text(
                  'BHD Star Cineplex',
                  style: FONT_CONST.MEDIUM
                      .copyWith(color: COLOR_CONST.GRAY6, fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Seat:", style: FONT_CONST.REGULAR_BLACK2_12),
                WidgetSpacer(height: 4),
                Text(
                  "G2, G3",
                  style: FONT_CONST.OSWALD_REGULAR.copyWith(
                    color: COLOR_CONST.DEFAULT,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
