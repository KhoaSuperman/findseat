import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class ListAllCineScreen extends StatefulWidget {
  @override
  _ListAllCineScreenState createState() => _ListAllCineScreenState();
}

class _ListAllCineScreenState extends State<ListAllCineScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: COLOR_CONST.WHITE,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Placeholder(
                      fallbackHeight: 400,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 10, top: 13),
                      child: MySvgImage(
                        width: 19,
                        height: 16,
                        path: 'assets/ic_back.svg',
                        color: COLOR_CONST.BLUE,
                      ),
                    ),
                  ],
                ),
                WidgetSpacer(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: WidgetDistanceFilter(),
                ),
                WidgetSpacer(height: 4),
                WidgetListCineResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
