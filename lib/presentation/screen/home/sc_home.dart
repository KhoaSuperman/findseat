import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'barrel_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeLoaded) {
          return Scaffold(
            body: Container(
              color: COLOR_CONST.WHITE,
              child: ListView(
                children: <Widget>[
                  WidgetHomeToolbar(),
                  WidgetHomeBanner(),
                  WidgetSpacer(height: 30),
                  WidgetHomeCategories(),
                  WidgetSpacer(height: 30),
                  WidgetRecommendedSeats(),
                  WidgetSpacer(height: 30),
                  WidgetNearbyTheatres(),
                  WidgetSpacer(height: 30),
                  WidgetHomeEvents(),
                  WidgetSpacer(height: 30),
                  WidgetHomePlays(),
                  WidgetSpacer(height: 30),
                ],
              ),
            ),
          );
        } else if (state is HomeNotLoaded) {
          return Center(
            child: Text('Cannot load data'),
          );
        } else {
          return Text('Unknown state');
        }
      },
    );
  }
}
