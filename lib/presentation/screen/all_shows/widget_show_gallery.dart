import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetShowGallery extends StatefulWidget {
  @override
  _WidgetShowGalleryState createState() => _WidgetShowGalleryState();
}

class _WidgetShowGalleryState extends State<WidgetShowGallery>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  int currentTabIndex = 0;

  @override
  void initState() {
    _controller = TabController(
      length: 3,
      vsync: this,
    );

    _controller.addListener(() {
      setState(() {
        currentTabIndex = _controller.index;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTabs(),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              Container(child: Text('1')),
              Container(child: Text('1')),
              Container(child: Text('1')),
            ],
          ),
        )
      ],
    );
  }

  _buildTabs() {
    return DefaultTabController(
      length: 3,
      child: TabBar(
        controller: _controller,
        tabs: <Widget>[
          Tab(
            text: 'Now showing',
          ),
          Tab(
            text: 'Coming soon',
          ),
          Tab(
            text: 'Exclusive',
          ),
        ],
        onTap: (index) {},
        labelColor: COLOR_CONST.DEFAULT,
        labelStyle: FONT_CONST.MEDIUM_DEFAULT_12,
        unselectedLabelColor: COLOR_CONST.GRAY1_70,
        unselectedLabelStyle: FONT_CONST.REGULAR_GRAY1_12,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: RoundedRectIndicator(
            color: COLOR_CONST.DEFAULT, radius: 2, padding: 22, weight: 3.0),
      ),
    );
  }
}
