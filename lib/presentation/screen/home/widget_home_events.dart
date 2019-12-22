import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetHomeEvents extends StatelessWidget {
  List<ItemPosterVM> items = [
    ItemPosterVM('images/events/912b4ea18698ad3b3519003c1c65c97e@2x.png',
        'Happy Halloween 2K19', 'Music show'),
    ItemPosterVM('images/events/ef0453e3c63b754f983e6863fa5c1583@2x.png',
        'Music DJ king monger Sertical Visa', 'Music show'),
    ItemPosterVM('images/events/8cb99f7a9423e9a20e26dd5468668517@2x.png',
        'Summer sounds festival', 'Comedy show'),
    ItemPosterVM('images/events/e215ef68a07a9baa50e04b05a79970ae@2x.png',
        'Happy Halloween 2K19', 'Music show'),
  ];

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: items,
      label: 'Events',
      iconPath: 'assets/ic_events.svg',
    );
  }
}
