import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/svg_image.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetHomePosters extends StatelessWidget {
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

  String label;
  String iconPath;

  WidgetHomePosters(
      {@required this.items, @required this.label, @required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              MySvgImage(
                path: iconPath,
                width: 20,
                height: 20,
                color: COLOR_CONST.BLACK2,
              ),
              WidgetSpacer(width: 6),
              Expanded(
                child: Text(label.toUpperCase(),
                    style: FONT_CONST.MEDIUM_BLACK2_14),
              ),
              Expanded(
                child: Text('View all',
                    style: FONT_CONST.MEDIUM_DEFAULT_10,
                    textAlign: TextAlign.right),
              )
            ],
          ),
          WidgetSpacer(height: 14),
          _buildListPoster(),
        ],
      ),
    );
  }

  _buildListPoster() {
    return Container(
      height: 186,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var item = items[index];

          return _WidgetItemPoster(item);
        },
        separatorBuilder: (context, index) {
          return WidgetSpacer(width: 14);
        },
        physics: BouncingScrollPhysics(),
        itemCount: items.length,
      ),
    );
  }
}

class _WidgetItemPoster extends StatelessWidget {
  ItemPosterVM item;

  _WidgetItemPoster(this.item);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return GestureDetector(
      onTap: () {
        openShowDetails();
      },
      child: Container(
        width: 93,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item.photo,
                width: 93,
                height: 124,
                fit: BoxFit.contain,
              ),
            ),
            WidgetSpacer(height: 4),
            Text(item.title,
                style: FONT_CONST.REGULAR_BLACK2_12,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            WidgetSpacer(height: 2),
            Text(item.subTitle, style: FONT_CONST.REGULAR_GRAY6_10),
          ],
        ),
      ),
    );
  }

  void openShowDetails() {
    Navigator.pushNamed(_context, Router.SHOW_INFO);
  }
}

class ItemPosterVM {
  String title;
  String subTitle;
  String photo;

  ItemPosterVM(this.photo, this.title, this.subTitle);
}
