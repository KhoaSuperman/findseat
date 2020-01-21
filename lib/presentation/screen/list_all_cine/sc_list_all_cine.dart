import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/model/entity/distance_filter.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class ListAllCineScreen extends StatefulWidget {
  List<Cine> items = [];

  List<Cine> dataSource = Cine.SAMPLE_DATA;

  DistanceFilter currentFilter = DistanceFilter(from: 2, to: 5);

  @override
  _ListAllCineScreenState createState() => _ListAllCineScreenState();
}

class ListAllCineScreenProvider extends InheritedWidget {
  Widget child;
  ValueChanged<DistanceFilter> onFilterChanged;

  ListAllCineScreenProvider({
    @required this.child,
    @required this.onFilterChanged,
  });

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ListAllCineScreenProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class _ListAllCineScreenState extends State<ListAllCineScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.items = _filterByDistance(DistanceFilter.SAMPLE_DATA[0]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListAllCineScreenProvider(
      onFilterChanged: (filter) {
        setState(() {
          widget.items = _filterByDistance(filter);
        });
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: COLOR_CONST.WHITE,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      WidgetCineOnMapResult(items: widget.items),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 12, right: 10, top: 13),
                        child: MySvgImage(
                          width: 19,
                          height: 16,
                          path: 'assets/ic_back.svg',
                          color: COLOR_CONST.BLUE,
                        ),
                      ),
                    ],
                  ),
                  WidgetSpacer(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: WidgetDistanceFilter(),
                  ),
                  WidgetSpacer(height: 4),
                  WidgetListCineResult(widget.items),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Cine> _filterByDistance(DistanceFilter filter) {
    return widget.dataSource.where(
      (cine) {
        return cine.distance > filter.from && cine.distance < filter.to;
      },
    ).toList();
  }
}
