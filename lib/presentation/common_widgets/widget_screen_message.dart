import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetScreenMessage extends StatelessWidget {
  String msg;

  WidgetScreenMessage({required this.msg});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(msg, style: FONT_CONST.REGULAR_GRAY4_14),
        ),
      ),
    );
  }
}
