import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class PaymentMethodPickerScreen extends StatefulWidget {
  @override
  _PaymentMethodPickerScreenState createState() =>
      _PaymentMethodPickerScreenState();
}

class _PaymentMethodPickerScreenState extends State<PaymentMethodPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      color: COLOR_CONST.WHITE,
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var iconPath = '';
          var name = '';
          switch (index) {
            case 0:
              iconPath = 'assets/icon_visa.svg';
              name = 'Debit / Credit card';
              break;
            case 1:
              iconPath = 'assets/icon_upi.png';
              name = 'UDI';
              break;
            case 2:
              iconPath = 'assets/icon_netbanking.svg';
              name = 'Net banking';
              break;
          }

          return Container(
            height: 70,
            child: Row(
              children: <Widget>[
                index != 1
                    ? MySvgImage(
                        height: 40,
                        width: 40,
                        path: iconPath,
                        applyColorFilter: false,
                      )
                    : Image.asset(
                        iconPath,
                        width: 40,
                        height: 40,
                      ),
                WidgetSpacer(width: 14),
                Text(name, style: FONT_CONST.REGULAR_GRAY4_14),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: 3,
      ),
    );
  }
}
