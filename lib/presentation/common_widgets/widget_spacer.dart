import 'package:flutter/material.dart';

class WidgetSpacer extends StatelessWidget {
  double _height = 16;

  WidgetSpacer({double height}) : this._height = height;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.transparent,
      height: _height,
    );
  }
}
