import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'barrel_all_shows.dart';

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

  List<ItemShowVM> items = [
    ItemShowVM(
        "images/movie/fdf8fabbc12db9cddc60574f691d26c6@2x.png", "Bigil", 84),
    ItemShowVM(
        "images/movie/d4baeb81488e83cb54f041917ff62f59@2x.png", "Kaithi", 98),
    ItemShowVM(
        "images/movie/202693a21503970eac9090537062d5d3.png", "Gabbar", 84),
    ItemShowVM(
        "images/movie/81c106f1df72317e034fafa6c4975e9f.png", "Pizza - part 2", 98),
    ItemShowVM(
        "images/movie/61d30e82f43b1cab9f49e576ae457086@2x.png", "Asuran", 94),
    ItemShowVM(
        "images/movie/3890dc6228535cbf5eebd947738d4e52.png", "Sarkar", 87)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildTabs(),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: <Widget>[
              WidgetListShow(items),
              WidgetListShow(items.sublist(1, 3).toList()),
              WidgetListShow(items.sublist(3, 5).toList()),
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
