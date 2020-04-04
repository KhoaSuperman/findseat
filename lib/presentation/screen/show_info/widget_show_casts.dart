import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetShowCasts extends StatelessWidget {
  Show show;

  WidgetShowCasts({@required this.show});

  List<ItemCast> items = [];

  @override
  Widget build(BuildContext context) {
    items = show.casts.map((cast) => ItemCast.fromCast(cast)).toList();

    return Container(
      color: COLOR_CONST.WHITE,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text('Crews & Casts',
                      style: FONT_CONST.MEDIUM_BLACK2_14)),
              Expanded(
                  child: Text('View all >',
                      style: FONT_CONST.REGULAR_DEFAULT_10,
                      textAlign: TextAlign.right)),
            ],
          ),
          WidgetSpacer(height: 14),
          Container(
            child: WrapContentHozListView(
              separatorBuilder: (context, index) {
                return WidgetSpacer(width: 14);
              },
              itemBuilder: (context, index) {
                var item = items[index];
                return _WidgetItemCast(item);
              },
              list: items,
            ),
          ),
        ],
      ),
    );
  }
}

class _WidgetItemCast extends StatelessWidget {
  ItemCast item;

  _WidgetItemCast(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85,
//      height: 130,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 85 / 117,
              child: Image.network(
                item.photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          WidgetSpacer(height: 5),
          Text(
            item.name,
            style: FONT_CONST.REGULAR_GRAY4_12,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class ItemCast {
  String name;
  String photo;

  ItemCast(this.name, this.photo);

  ItemCast.fromCast(Cast cast) {
    this.name = cast.name;
    this.photo = cast.photo;
  }
}
