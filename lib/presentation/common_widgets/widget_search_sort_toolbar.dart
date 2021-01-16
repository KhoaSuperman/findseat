import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/svg_image.dart';
import 'package:find_seat/presentation/screen/booking/book_time_slot/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

//TODO: duplicate with WidgetAllShowsToolbar. should refactor into one
class WidgetSearchSortToolbar extends StatefulWidget {
  String title;

  WidgetSearchSortToolbar({
    this.title,
  });

  @override
  _WidgetSearchSortToolbarState createState() => _WidgetSearchSortToolbarState();
}

class _WidgetSearchSortToolbarState extends State<WidgetSearchSortToolbar> {
  BuildContext _blocContext;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      final keyword = _searchController.text;
      if (keyword.isNotEmpty) {
        BlocProvider.of<BookTimeSlotBloc>(_blocContext)
            .add(SearchQueryChanged(keyword: keyword));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookTimeSlotBloc, BookTimeSlotState>(
      listener: (context, state) {},
      builder: (context, state) {
        _blocContext = context;

        if (state is BookTimeSlotState) {
          return Container(
            color: COLOR_CONST.BLUE,
            height: 50,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 10),
                    child: MySvgImage(
                      width: 19,
                      height: 16,
                      path: 'assets/ic_back.svg',
                    ),
                  ),
                ),
                Expanded(
                  child: _buildTitle(state),
                ),
                _buildActions(state),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _buildActions(BookTimeSlotState state) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            BlocProvider.of<BookTimeSlotBloc>(_blocContext).add(
                state.showSearchField ? ClickCloseSearch() : ClickIconSearch());
          },
          child: MySvgImage(
            path: state.showSearchField
                ? "assets/ic_close.svg"
                : "assets/ic_search.svg",
            width: 20,
            height: 20,
          ),
        ),
        WidgetSpacer(width: 12),
        InkWell(
          onTap: () {
//            BlocProvider.of<BookTimeSlotBloc>(_blocContext).add(ClickIconSort());
          },
          child: MySvgImage(
            path: "assets/ic_more.svg",
            width: 20,
            height: 20,
          ),
        ),
        WidgetSpacer(width: 12)
      ],
    );
  }

  _buildTitle(BookTimeSlotState state) {
    if (state.showSearchField) {
      return TextField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        maxLines: 1,
        autofocus: true,
        textInputAction: TextInputAction.search,
        style: FONT_CONST.REGULAR_WHITE_14,
        decoration: InputDecoration(
            hintText: 'Search', hintStyle: FONT_CONST.REGULAR_GRAY4_14),
      );
    } else
      return Text(widget.title, style: FONT_CONST.MEDIUM_WHITE_16);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
