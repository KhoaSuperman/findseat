import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetShowCasts extends StatelessWidget {
  List<ItemCast> items = [
    ItemCast('Chadwick', 'images/casts/81202d0dea55189fa442a1ab932a81a7.png'),
    ItemCast(
        'Letitia Wright', 'images/casts/646262125800725e14d8c4ff4b2a2181.png'),
    ItemCast('B. Jordan', 'images/casts/a053e9fb0c813cd15b34a2edff71ae9d.png'),
    ItemCast(
        'Lupita Nyong', 'images/casts/289bf4c714c627dc42b17199024a152d.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
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
            height: 130,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return WidgetSpacer(width: 14);
              },
              itemBuilder: (context, index) {
                var item = items[index];
                return _WidgetItemCast(item);
              },
              itemCount: items.length,
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
      height: 130,
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              item.photo,
              fit: BoxFit.cover,
              width: 85,
              height: 107,
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
}
