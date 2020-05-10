import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/bloc/bloc.dart';
import 'package:find_seat/presentation/screen/booking/book_seat_slot/viewmodel/viewmodel.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetItemGridSeatSlot extends StatefulWidget {
  ItemGridSeatSlotVM itemGridSeatSlotVM;

  WidgetItemGridSeatSlot({@required this.itemGridSeatSlotVM});

  @override
  _WidgetItemGridSeatSlotState createState() => _WidgetItemGridSeatSlotState();
}

class _WidgetItemGridSeatSlotState extends State<WidgetItemGridSeatSlot> {
  ItemGridSeatSlotVM itemGridSeatSlotVM;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    itemGridSeatSlotVM = widget.itemGridSeatSlotVM;

    return Container(
      color: COLOR_CONST.WHITE,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(itemGridSeatSlotVM.seatTypeName,
              style: FONT_CONST.REGULAR_GRAY4_12),
          WidgetSpacer(height: 14),
          _buildSlotGrid(),
        ],
      ),
    );
  }

  _buildSlotGrid() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 40,
        maxHeight: 200,
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: itemGridSeatSlotVM.maxColumn,
        scrollDirection: Axis.vertical,
        childAspectRatio: 1,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        children: _generatedGrid(),
      ),
    );
  }

  List<Widget> _generatedGrid() {
    List<Widget> widgets = [];

    itemGridSeatSlotVM.seatRowVMs.forEach((itemSeatRowVM) {
      //ITEM ROW NAME
      var itemRowName = Container(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            itemSeatRowVM.itemRowName,
            style: FONT_CONST.REGULAR_GRAY4_40_12,
          ),
        ),
      );

      widgets.add(itemRowName);

      //ITEM SEAT SLOT
      List<Widget> widgetSeatSlots = itemSeatRowVM.seatSlotVMs.map(
        (itemSeatSlotVM) {
          var itemBgColor = COLOR_CONST.SEAT_SLOT_BG;
          var itemBorderColor = COLOR_CONST.SEAT_SLOT_BORDER;

          if (itemSeatSlotVM.isBooked) {
            itemBgColor = COLOR_CONST.SEAT_SLOT_BG_BOOKED;
          }

          if (itemSeatSlotVM.isSelected) {
            itemBgColor = COLOR_CONST.GREEN;
            itemBorderColor = COLOR_CONST.TRANS;
          }

          var itemAvailable = GestureDetector(
            onTap: () {
              _handleSelectSeat(itemSeatSlotVM);
            },
            child: Container(
              decoration: BoxDecoration(
                color: itemBgColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: itemBorderColor,
                  width: 1,
                ),
              ),
//            child: Center(child: Text('${seatRow.rowId}${i + 1}')),
            ),
          );

          var itemEmpty = Container();

          return itemSeatSlotVM.isOff ? itemEmpty : itemAvailable;
        },
      ).toList();

      widgets.addAll(widgetSeatSlots);
    });

    return widgets;
  }

  _handleSelectSeat(ItemSeatSlotVM itemSeatSlotVM) {
    BlocProvider.of<BookSeatSlotBloc>(context)
        .add(ClickSelectSeatSlot(itemSeatSlotVM: itemSeatSlotVM));
  }
}
