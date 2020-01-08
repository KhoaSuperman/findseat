import 'package:find_seat/model/barrel_model.dart';
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
          WidgetNumberSeatPicker(),
          WidgetSeatTypePicker(),
          WidgetSpacer(height: 94),
        ],
      ),
    );
  }
}

/// WidgetSeatTypePicker
class WidgetSeatTypePicker extends StatefulWidget {
  List<SeatType> seatTypes = [
    SeatType('King', 120.0, SEAT_TYPE.KING),
    SeatType('Queen', 100.0, SEAT_TYPE.QUEEN),
    SeatType('Jack', 80.0, SEAT_TYPE.JACK),
  ];

  @override
  _WidgetSeatTypePickerState createState() => _WidgetSeatTypePickerState();
}

class _WidgetSeatTypePickerState extends State<WidgetSeatTypePicker> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19, vertical: 40),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 137,
          maxHeight: 237,
        ),
        child: GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: widget.seatTypes.length,
          scrollDirection: Axis.vertical,
          childAspectRatio: 94 / 137,
          crossAxisSpacing: 19,
          children: <Widget>[
            for (final seatType in widget.seatTypes)
              _buildItemSeatType(seatType)
          ],
        ),
      ),
    );
  }

  _buildItemSeatType(SeatType seatType) {
    var index = widget.seatTypes.indexOf(seatType);
    var isSelected = index == _selectedIndex;

    String textStatus = index == 0 ? 'Filling fast' : 'Available';
    var itemBg = isSelected ? COLOR_CONST.GREEN : COLOR_CONST.TIME_SLOT_BG;
    var itemBorder =
        isSelected ? Colors.transparent : COLOR_CONST.TIME_SLOT_BORDER;
    var nameColor = isSelected ? COLOR_CONST.WHITE_70 : COLOR_CONST.GRAY1_70;
    var priceColor = isSelected ? COLOR_CONST.WHITE : COLOR_CONST.BLUE;
    var statusColor = priceColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: itemBg,
          border: Border.all(color: itemBorder),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(seatType.name,
                style: FONT_CONST.REGULAR_WHITE_12.copyWith(color: nameColor)),
            Text('\$ ${seatType.price}',
                style: FONT_CONST.MEDIUM_WHITE_14.copyWith(color: priceColor)),
            WidgetSpacer(height: 32),
            Text(textStatus,
                style:
                    FONT_CONST.REGULAR_WHITE_12.copyWith(color: statusColor)),
          ],
        ),
      ),
    );
  }
}

/// WidgetNumberSeatPicker
class WidgetNumberSeatPicker extends StatefulWidget {
  @override
  _WidgetNumberSeatPickerState createState() => _WidgetNumberSeatPickerState();
}

class _WidgetNumberSeatPickerState extends State<WidgetNumberSeatPicker> {
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
