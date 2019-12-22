import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MySvgImage extends StatelessWidget {
  String path;
  double width;
  double height;
  Color color;

  MySvgImage(
      {@required this.path,
      @required this.width,
      @required this.height,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: width,
      height: height,
      color: color,
    );
  }
}
