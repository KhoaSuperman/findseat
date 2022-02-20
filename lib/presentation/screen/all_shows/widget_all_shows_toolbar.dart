import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/svg_image.dart';
import 'package:find_seat/presentation/screen/all_shows/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetAllShowsToolbar extends StatefulWidget {
  @override
  _WidgetAllShowsToolbarState createState() => _WidgetAllShowsToolbarState();
}

class _WidgetAllShowsToolbarState extends State<WidgetAllShowsToolbar> {
  late BuildContext _blocContext;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _searchController.addListener(() {
      final keyword = _searchController.text;
      if (keyword.isNotEmpty) {
        BlocProvider.of<AllShowsBloc>(_blocContext)
            .add(SearchQueryChanged(keyword: keyword));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllShowsBloc, AllShowsState>(
      listener: (context, state) {},
      buildWhen: (prev, current) {
        return current is UpdateToolbarState;
      },
      builder: (context, state) {
        _blocContext = context;

        if (state is UpdateToolbarState) {
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

  _buildActions(UpdateToolbarState state) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            BlocProvider.of<AllShowsBloc>(_blocContext).add(
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
            BlocProvider.of<AllShowsBloc>(_blocContext).add(ClickIconSort());
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

  _buildTitle(UpdateToolbarState state) {
    if (state.showSearchField) {
      _searchController.text = "";
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
      return Text('Movies in coimbatore', style: FONT_CONST.MEDIUM_WHITE_16);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
