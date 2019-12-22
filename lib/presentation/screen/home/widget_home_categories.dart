import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/presentation/custom_ui/svg_image.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetHomeCategories extends StatelessWidget {
  List<_ItemCategoryVM> items = [
    _ItemCategoryVM("Movies", "assets/ic_film.svg"),
    _ItemCategoryVM("Events", "assets/ic_events.svg"),
    _ItemCategoryVM("Plays", "assets/ic_plays.svg"),
    _ItemCategoryVM("Sports", "assets/ic_sports.svg"),
    _ItemCategoryVM("Activity", "assets/ic_activity.svg"),
    _ItemCategoryVM("Monum", "assets/ic_monum.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Seat categories'.toUpperCase(),
              style: FONT_CONST.MEDIUM_BLACK2_14),
          WidgetSpacer(height: 14),
          _buildListCategory(),
        ],
      ),
    );
  }

  _buildListCategory() {
    return Container(
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _WidgetItemCategory(item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 30);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }
}

class _WidgetItemCategory extends StatelessWidget {
  _ItemCategoryVM item;

  _WidgetItemCategory(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 34,
          height: 34,
          child: Center(
            child: MySvgImage(
              path: item.image,
              width: 28,
              height: 28,
              applyColorFilter: false,
            ),
          ),
        ),
        WidgetSpacer(height: 6),
        Text(item.title, style: FONT_CONST.REGULAR_GRAY6_12),
      ],
    );
  }
}

class _ItemCategoryVM {
  String image;
  String title;

  _ItemCategoryVM(this.title, this.image);
}
