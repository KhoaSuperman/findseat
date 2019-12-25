import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';

class WidgetBtnBack extends StatelessWidget {

  EdgeInsets padding;

  WidgetBtnBack({this.padding = const EdgeInsets.only(left: 12, right: 10)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Padding(
        padding: padding,
        child: MySvgImage(
          width: 19,
          height: 16,
          path: 'assets/ic_back.svg',
        ),
      ),
    );
  }
}
