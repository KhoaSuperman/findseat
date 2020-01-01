import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/cine_date_picker/barrel_cine_date_picker.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetItemWeek extends StatefulWidget {
  ItemWeek itemWeek;

  WidgetItemWeek(this.itemWeek);

  @override
  _WidgetItemWeekState createState() => _WidgetItemWeekState();
}

class _WidgetItemWeekState extends State<WidgetItemWeek> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 30,
          child: Text(
            widget.itemWeek.label,
            style: FONT_CONST.REGULAR_GRAY1_10,
            textAlign: TextAlign.right,
          ),
        ),
        WidgetSpacer(width: 12),
        Container(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return _buildItemDate(index);
            },
            separatorBuilder: (context, index) {
              return WidgetSpacer(width: 10);
            },
            itemCount: widget.itemWeek.dates.length,
          ),
        )
      ],
    );
  }

  _buildItemDate(int index) {
    var selectedDate = CineDatePickerScreenProvider.of(context).selectedDate;
    DateTime date = widget.itemWeek.dates[index];

    bool isToday = date.day == 14;
    bool isSelected = selectedDate != null && selectedDate.day == date.day;

    var bgColor = isSelected ? COLOR_CONST.DEFAULT : COLOR_CONST.GRAY2;
    var textColor = isSelected ? COLOR_CONST.WHITE : COLOR_CONST.GRAY4;
    var textDate = date.day.toString();

    return GestureDetector(
      onTap: () {
        CineDatePickerScreenProvider.of(context).onDateSelected(date);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(4),
          color: bgColor,
        ),
        child: isToday
            ? Column(
                children: <Widget>[
                  Text('Today',
                      style: FONT_CONST.REGULAR_GRAY4_8
                          .copyWith(fontSize: 7, color: textColor)),
                  Text(textDate,
                      style: FONT_CONST.REGULAR_GRAY4_14
                          .copyWith(color: textColor)),
                ],
              )
            : Center(
                child: Text(textDate,
                    style:
                        FONT_CONST.REGULAR_GRAY4_14.copyWith(color: textColor)),
              ),
      ),
    );
  }
}
