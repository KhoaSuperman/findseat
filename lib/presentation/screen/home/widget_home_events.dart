import 'package:find_seat/model/entity/categoryy.dart';
import 'package:find_seat/model/entity/show.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:flutter/material.dart';

class WidgetHomeEvents extends StatelessWidget {
  List<ItemPosterVM> items = [];

  Categoryy category;
  List<Show> shows;

  WidgetHomeEvents({
    required this.category,
    required this.shows,
  });

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: shows.map((show) => ItemPosterVM.fromShow(show)).toList(),
      label: category.name,
      iconPath: 'assets/${category.icon}',
    );
  }
}
