import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/COLOR_CONST.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/material.dart';

import 'widget_item_list_my_ticker.dart';

class ListMyTicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            WidgetToolbar(
              title: 'My Tickets',
              actions: MySvgImage.toolbarIcon("assets/ic_more.svg"),
            ),
            _buildHeader(),
            Expanded(
              child: _buildList(),
            )
          ],
        ),
      ),
    );
  }

  _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          WidgetSpacer(height: 32),
          Image.asset(
            'assets/ticket_color.png',
            height: 89,
          ),
          WidgetSpacer(height: 8),
          Text(
            'Save 30% off'.toUpperCase(),
            style: FONT_CONST.OSWALD_REGULAR
                .copyWith(fontSize: 28, color: COLOR_CONST.DEFAULT),
          ),
          WidgetSpacer(height: 4),
          Text(
            'Only December 15, when buying a movie ticket and bringing a hat, you will receive one CGV free popcorn',
            style: FONT_CONST.MEDIUM_GRAY4.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          WidgetSpacer(height: 16),
          Container(
            width: 32,
            height: 4,
            decoration: BoxDecoration(
              color: COLOR_CONST.DEFAULT,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          WidgetSpacer(height: 16),
        ],
      ),
    );
  }

  _buildList() {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return WidgetItemListMyTicker();
        },
        separatorBuilder: (context, index) {
          return WidgetSpacer(height: 16);
        },
        itemCount: 20);
  }
}
