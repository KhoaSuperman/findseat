import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/cine_date_picker/barrel_cine_date_picker.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class CineDatePickerScreen extends StatefulWidget {
  @override
  _CineDatePickerScreenState createState() => _CineDatePickerScreenState();
}

class _CineDatePickerScreenState extends State<CineDatePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.WHITE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Friday, Nov 14, 2019',
                style: FONT_CONST.REGULAR_BLACK2_14),
          ),
          Divider(color: COLOR_CONST.DIVIDER, height: 1),
          _buildListDateByWeek(),
        ],
      ),
    );
  }

  _buildListDateByWeek() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 18, top: 13.5, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetListDateLabel(),
          _buildListWeeks(),
        ],
      ),
    );
  }

  static DateTime _getStartDate() {
    var dNow = DateTime.now();
    return DateTime.utc(dNow.year, dNow.month, 9);
  }

  List<ItemWeek> weeks = [
    ItemWeek(
        'This week',
        List<int>.generate(7, (i) => i + 1)
            .map((day) => _getStartDate().add(Duration(days: day)))
            .toList()),
    ItemWeek(
        'Next week',
        List<int>.generate(7, (i) => i + 1)
            .map((day) => _getStartDate()
                .add((Duration(days: 7)))
                .add(Duration(days: day)))
            .toList())
  ];

  _buildListWeeks() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return WidgetItemWeek(weeks[index]);
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(height: 16);
      },
      shrinkWrap: true,
      itemCount: weeks.length,
    );
  }
}

class ItemWeek {
  String label;
  List<DateTime> dates = [];

  ItemWeek(this.label, this.dates);
}
