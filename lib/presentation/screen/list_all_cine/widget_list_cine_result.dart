import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetListCineResult extends StatefulWidget {
  List<Cine> items = [];

  WidgetListCineResult(this.items);

  @override
  _WidgetListCineResultState createState() => _WidgetListCineResultState();
}

class _WidgetListCineResultState extends State<WidgetListCineResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _ItemWidgetCineResult(widget.items[index]);
        },
        separatorBuilder: (context, index) {
          return WidgetSpacer(height: 20);
        },
        itemCount: widget.items.length,
      ),
    );
  }
}

class _ItemWidgetCineResult extends StatelessWidget {
  Cine cine;

  _ItemWidgetCineResult(this.cine);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              cine.photo,
              width: 90,
              height: 90,
            ),
          ),
          WidgetSpacer(width: 14),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(cine.name, style: FONT_CONST.MEDIUM_BLUE_14),
                WidgetSpacer(height: 4),
                Row(
                  children: <Widget>[
                    MySvgImage(
                      path: 'assets/ic_cine_dot.svg',
                      width: 14,
                      height: 14,
                      color: COLOR_CONST.GRAY1,
                    ),
                    WidgetSpacer(width: 4),
                    Text(cine.address, style: FONT_CONST.REGULAR_GRAY1_12),
                  ],
                ),
                WidgetSpacer(height: 8),
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: COLOR_CONST.DEFAULT, size: 14),
                    WidgetSpacer(width: 4),
                    Text("${cine.rating} stars",
                        style: FONT_CONST.REGULAR_GRAY4_12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
