import 'package:flutter/material.dart';

import 'barrel_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            WidgetHomeToolbar(),
            WidgetHomeBanner(),
            WidgetHomeCategories(),
            WidgetRecommendedSeats(),
            WidgetNearbyTheatres(),
            WidgetHomeEvents(),
            WidgetHomePlays(),
          ],
        ),
      ),
    );
  }
}
