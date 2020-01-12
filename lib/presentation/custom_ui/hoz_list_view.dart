import 'package:flutter/material.dart';

class WrapContentHozListView<T> extends StatefulWidget {
  List<T> list;
  IndexedWidgetBuilder itemBuilder;
  IndexedWidgetBuilder separatorBuilder;

  WrapContentHozListView({
    @required this.list,
    @required this.itemBuilder,
    this.separatorBuilder,
  });

  @override
  _WrapContentHozListViewState createState() => _WrapContentHozListViewState();
}

class _WrapContentHozListViewState extends State<WrapContentHozListView> {
  List<Widget> _generateItemWidgets() {
    List<Widget> items = [];
    for (int i = 0; i < widget.list.length; i++) {
      items.add(widget.itemBuilder(context, i));
      if (widget.separatorBuilder != null) {
        items.add(widget.separatorBuilder(context, i));
      }
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _generateItemWidgets(),
      ),
    );
  }
}
