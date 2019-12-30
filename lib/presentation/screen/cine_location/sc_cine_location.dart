import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/screen/cine_location/barrel_cine_location.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CineLocationScreen extends StatelessWidget {
  List<String> facilities = ['Cancel', 'Parking', 'Hotel', 'Park'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Container(
//            height: double.infinity, width: double.infinity,
            color: COLOR_CONST.WHITE,
            margin: EdgeInsets.only(top: 32),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                WidgetCineOnMap(),
                WidgetSpacer(height: 20),
                Text('INOX - Prozone mall', style: FONT_CONST.MEDIUM_BLUE_16),
                WidgetSpacer(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MySvgImage(
                      path: 'assets/ic_cine_dot.svg',
                      width: 9.94,
                      height: 12,
                      applyColorFilter: false,
                    ),
                    WidgetSpacer(width: 6),
                    Text('Coimbatore', style: FONT_CONST.REGULAR_GRAY1_12),
                  ],
                ),
                WidgetSpacer(height: 22),
                Text(
                    'SP Towers, 343, Sathy Rd, Ramakrishnapuram, Saravanampatti, Coimbatore, Tamil Nadu 641035',
                    textAlign: TextAlign.center,
                    style: FONT_CONST.REGULAR_GRAY1_12),
                WidgetSpacer(height: 20),
                _buildFacilities(),
              ],
            ),
          ),
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
                color: COLOR_CONST.DEFAULT, shape: BoxShape.circle),
            child: Center(
              child: MySvgImage(
                path: 'assets/ic_cine_location.svg',
                width: 29.98,
                height: 26.54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildFacilities() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Available facilities',
          style: FONT_CONST.REGULAR_BLUE_14,
        ),
        WidgetSpacer(height: 14),
        LimitedBox(
          maxHeight: 69,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return WidgetItemFacility(facilities[index]);
            },
            separatorBuilder: (context, index) {
              return WidgetSpacer(width: 48);
            },
            itemCount: facilities.length,
          ),
        )
      ],
    );
  }
}

class WidgetItemFacility extends StatelessWidget {
  String facilityName;

  WidgetItemFacility(this.facilityName);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: COLOR_CONST.DEFAULT_5,
          ),
          child: Center(
            child: MySvgImage(
              path: _fromName(facilityName),
              width: 20,
              height: 20,
              applyColorFilter: false,
            ),
          ),
        ),
        WidgetSpacer(height: 10),
        Text(facilityName, style: FONT_CONST.REGULAR_GRAY4_10),
      ],
    );
  }

  String _fromName(String name) {
    switch (name.toLowerCase()) {
      case 'cancel':
        return 'assets/ic_cancel.svg';
      case 'parking':
        return 'assets/ic_parking.svg';
      case 'hotel':
        return 'assets/ic_hotel.svg';
      case 'park':
        return 'assets/ic_park.svg';
      default:
        return null;
    }
  }
}
