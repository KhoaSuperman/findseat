import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetShowTrailer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 360 / 196,
      child: Stack(
        children: <Widget>[
          Image.asset(
            "images/thumb_show.png",
            fit: BoxFit.contain,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 42,
              width: 42,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.black38),
              child: Center(
                child: MySvgImage(
                  width: 16.72,
                  height: 15.07,
                  path: 'assets/ic_play.svg',
                ),
              ),
            ),
          ),
          WidgetBtnBack(
            padding: const EdgeInsets.only(left: 20, top: 20),
          ),
        ],
      ),
    );
  }
}
