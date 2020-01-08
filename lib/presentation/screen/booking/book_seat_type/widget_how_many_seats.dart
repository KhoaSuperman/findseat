import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetHowManySeats extends StatefulWidget {
  @override
  _WidgetHowManySeatsState createState() => _WidgetHowManySeatsState();
}

class _WidgetHowManySeatsState extends State<WidgetHowManySeats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: COLOR_CONST.WHITE,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          WidgetSpacer(height: 34),
          Text('How many seats ?', style: FONT_CONST.REGULAR_BLUE_16),
          WidgetSpacer(height: 37),
          Image.asset('images/motor_bike.png', height: 90.57),
          WidgetSpacer(height: 30),
          _WidgetNumberSeatPicker(),
        ],
      ),
    );
  }
}

class _WidgetNumberSeatPicker extends StatefulWidget {
  @override
  __WidgetNumberSeatPickerState createState() =>
      __WidgetNumberSeatPickerState();
}

class __WidgetNumberSeatPickerState extends State<_WidgetNumberSeatPicker> {
  List<int> seats = List<int>.generate(10, (index) => index + 1);

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var isSelected = _selectedIndex == index;
          var boxColor = isSelected ? COLOR_CONST.GREEN : Colors.transparent;
          var textColor = isSelected ? COLOR_CONST.WHITE : COLOR_CONST.GRAY4;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  seats[index].toString(),
                  style: FONT_CONST.MEDIUM_WHITE_14.copyWith(color: textColor),
                ),
              ),
            ),
          );
        },
        itemCount: seats.length,
      ),
    );
  }
}
