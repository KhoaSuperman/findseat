import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetListDateLabel extends StatelessWidget {
  List<String> labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(left: 42),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            height: 32,
            width: 32,
            child: Center(
                child:
                    Text(labels[index], style: FONT_CONST.REGULAR_GRAY1_50_12)),
          );
        },
        separatorBuilder: (context, index) {
          return WidgetSpacer(width: 10);
        },
        itemCount: labels.length,
      ),
    );
  }
}
