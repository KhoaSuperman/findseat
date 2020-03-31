import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/home/barrel_home.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/home/home_shows_category/bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeShowsCategory extends StatefulWidget {
  @override
  _WidgetHomeShowsCategoryState createState() =>
      _WidgetHomeShowsCategoryState();
}

class _WidgetHomeShowsCategoryState extends State<WidgetHomeShowsCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeShowsCategoryBloc, HomeShowsCategoryState>(
      builder: (context, state) {
        if (state is ShowsByCategoryLoaded) {
          final list = state.list;

          return Container(
            child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final mapEntry = list[index];
                  final category = mapEntry.key;
                  final shows = mapEntry.value;

                  return WidgetHomeEvents(
                    category: category,
                    shows: shows,
                  );
                },
                separatorBuilder: (context, index) {
                  return WidgetSpacer(height: 20);
                },
                itemCount: list.length),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
