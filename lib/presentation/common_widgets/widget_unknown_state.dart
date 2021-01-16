import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetUnknownState extends StatelessWidget {
  WidgetUnknownState();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text('Unknown state', style: FONT_CONST.REGULAR_GRAY4_14),
        ),
      ),
    );
  }
}
