import 'package:find_seat/model/entity/entity_enum.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/all_shows/barrel_all_shows.dart';
import 'package:find_seat/presentation/screen/all_shows/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AllShowsScreen extends StatefulWidget {
  @override
  _AllShowsScreenState createState() => _AllShowsScreenState();
}

class _AllShowsScreenState extends State<AllShowsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<AllShowsBloc>(
          create: (context) => AllShowsBloc(
              showRepository: RepositoryProvider.of<ShowRepository>(context))
            ..add(OpenScreen()),
          child: Container(
            child: Column(
              children: <Widget>[
                WidgetAllShowsToolbar(),
                Expanded(
                  child: _buildContent(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return BlocConsumer<AllShowsBloc, AllShowsState>(
      listenWhen: (prev, current) {
        return current is OpenSortOption;
      },
      listener: (context, state) {
        if (state is OpenSortOption) {
          _openSortByOptions(context, state.showSortBy);
        }
      },
      buildWhen: (prev, current) {
        return current is! UpdateToolbarState && current is! OpenSortOption;
      },
      builder: (context, state) {
        if (state is DisplayListShows) {
          if (state.loading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state.msg != null) {
            return Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(state.msg, style: FONT_CONST.REGULAR_GRAY4_14),
                ),
              ),
            );
          }

          if (state.meta != null) {
            return WidgetShowGallery(meta: state.meta);
          }

          return Container();
        } else
          return Container();
      },
    );
  }

  Future<void> _openSortByOptions(
      BuildContext context, SHOW_SORT_BY showSortBy) async {
    switch (await showDialog<SHOW_SORT_BY>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Sort by'),
            children: <Widget>[
              SimpleDialogOption(
                child: RadioListTile(
                  title: Text('Rating', style: FONT_CONST.REGULAR_BLACK2_14),
                  value: SHOW_SORT_BY.RATING,
                  groupValue: showSortBy,
                  onChanged: (value) {
                    Navigator.pop(context, value);
                  },
                ),
              ),
              SimpleDialogOption(
                child: RadioListTile(
                  title: Text('Name', style: FONT_CONST.REGULAR_BLACK2_14),
                  value: SHOW_SORT_BY.NAME,
                  groupValue: showSortBy,
                  onChanged: (value) {
                    Navigator.pop(context, value);
                  },
                ),
              ),
            ],
          );
        })) {
      case SHOW_SORT_BY.NAME:
        BlocProvider.of<AllShowsBloc>(context)
            .add(SortByChanged(SHOW_SORT_BY.NAME));
        break;
      case SHOW_SORT_BY.RATING:
        BlocProvider.of<AllShowsBloc>(context)
            .add(SortByChanged(SHOW_SORT_BY.RATING));
        break;
    }
  }
}
