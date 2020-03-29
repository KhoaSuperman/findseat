import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/screen/all_shows/barrel_all_shows.dart';
import 'package:find_seat/presentation/screen/all_shows/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/FONT_CONST.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AllShowsScreen extends StatelessWidget {
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
    return BlocBuilder<AllShowsBloc, AllShowsState>(
      condition: (prev, current) {
        return current is! UpdateToolbarState;
      },
      builder: (context, state) {
        if (state is DisplayListShows) {
          return WidgetShowGallery(meta: state.meta);
        } else if (state is LoadingData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is NoData) {
          return Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(state.msg, style: FONT_CONST.REGULAR_GRAY4_14),
              ),
            ),
          );
        } else
          return Container();
      },
    );
  }
}
