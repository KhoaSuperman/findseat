import 'package:find_seat/model/entity/distance_filter.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetDistanceFilter extends StatefulWidget {
  List<DistanceFilter> filters = DistanceFilter.SAMPLE_DATA;

  @override
  _WidgetDistanceFilterState createState() => _WidgetDistanceFilterState();
}

class _WidgetDistanceFilterState extends State<WidgetDistanceFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WrapContentHozListView(
      list: widget.filters,
      itemBuilder: (context, index) {
        var filter = widget.filters[index];
        var isSelected = selectedIndex == index;

        var itemBgColor = isSelected ? COLOR_CONST.DEFAULT : COLOR_CONST.WHITE;
        var itemBgBorderColor =
            isSelected ? COLOR_CONST.TRANS : COLOR_CONST.DEFAULT_BORDER;
        var textColor = isSelected ? COLOR_CONST.WHITE : COLOR_CONST.GRAY1;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;

              ListAllCineScreenProvider.of(context).onFilterChanged(filter);
            });
          },
          child: Container(
            decoration: BoxDecoration(
              color: itemBgColor,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: itemBgBorderColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text('${filter.from} - ${filter.to} kms',
                  style: FONT_CONST.MEDIUM_WHITE_12.copyWith(color: textColor)),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(width: 10);
      },
    );
  }
}
