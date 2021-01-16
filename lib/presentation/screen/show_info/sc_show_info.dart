import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/model/repo/repo.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/show_info/barrel_show_info.dart';
import 'package:find_seat/presentation/screen/show_info/bloc/show_details_bloc.dart';
import 'package:find_seat/presentation/screen/show_info/bloc/show_details_event.dart';
import 'package:find_seat/presentation/screen/show_info/bloc/show_details_state.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ShowInfoScreen extends StatelessWidget {
  Show show;

  ShowInfoScreen({@required this.show});

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ShowDetailsBloc>(
        create: (context) => ShowDetailsBloc(
          sessionRepository: RepositoryProvider.of<SessionRepository>(context),
        ),
        child: BlocConsumer<ShowDetailsBloc, ShowDetailsState>(
          buildWhen: (prev, current) {
            return current is InitialShowDetailsState;
          },
          listenWhen: (prev, current) {
            return current is OpenBookTimeSlotScreen;
          },
          listener: (context, state) {
            openBookCineTimeSlot();
          },
          builder: (context, state) {
            _context = context;

            return Scaffold(
              body: Stack(
                children: [
                  ListView(
                    children: <Widget>[
                      WidgetVideoPlayer(videoUrl: show.trailer),
                      WidgetShowDesc(show: show),
                      WidgetSpacer(height: 14),
                      WidgetOffers(show: show),
                      WidgetSpacer(height: 14),
                      WidgetShowReview(show: show),
                      WidgetSpacer(height: 14),
                      WidgetShowCasts(show: show),
                      WidgetSpacer(height: 70),
                    ],
                  ),
                  _buildBtnBookSeat(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _buildBtnBookSeat() {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 54,
        child: FlatButton(
          color: COLOR_CONST.DEFAULT,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MySvgImage(
                width: 18.25,
                height: 16.1,
                path: 'assets/ic_sofa.svg',
              ),
              WidgetSpacer(width: 5),
              Text('Book seats', style: FONT_CONST.MEDIUM_WHITE_16),
            ],
          ),
          onPressed: () {
            BlocProvider.of<ShowDetailsBloc>(_context).add(ClickBtnBook(show));
          },
        ),
      ),
    );
  }

  void openBookCineTimeSlot() {
    BlocProvider.of<ShowDetailsBloc>(_context).add(OpenedBookTimeSlotScreen());
    Navigator.pushNamed(_context, AppRouter.BOOK_TIME_SLOT, arguments: show);
  }
}
