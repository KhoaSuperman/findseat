import 'package:find_seat/model/entity/entity.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/home/recommended_seats/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetRecommendedSeats extends StatelessWidget {
  List<_ItemRecommendedSeatVM> items = [
//    _ItemRecommendedSeatVM(
//        "images/movie/fdf8fabbc12db9cddc60574f691d26c6@2x.png", "Bigil", 84),
//    _ItemRecommendedSeatVM(
//        "images/movie/d4baeb81488e83cb54f041917ff62f59@2x.png", "Kaithi", 98),
//    _ItemRecommendedSeatVM(
//        "images/movie/61d30e82f43b1cab9f49e576ae457086@2x.png", "Asuran", 94),
//    _ItemRecommendedSeatVM(
//        "images/movie/3890dc6228535cbf5eebd947738d4e52@2x.png", "Sarkar", 87)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedSeatsBloc, RecommendedSeatsState>(
      builder: (context, state) {
        if (state is RecommendedSeatsLoaded) {
          items = state.shows
              .map((show) => _ItemRecommendedSeatVM.fromShow(show))
              .toList();

          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Recommended Seats'.toUpperCase(),
                    style: FONT_CONST.MEDIUM_BLACK2_14),
                WidgetSpacer(height: 14),
                _buildListRecommendedSeats(),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _buildListRecommendedSeats() {
    return WrapContentHozListView(
      list: items,
      itemBuilder: (context, index) {
        var item = items[index];

        return _WidgetItemRecommendedSeat(item);
      },
      separatorBuilder: (context, index) {
        return WidgetSpacer(width: 14);
      },
    );
  }
}

class _WidgetItemRecommendedSeat extends StatelessWidget {
  _ItemRecommendedSeatVM item;

  _WidgetItemRecommendedSeat(this.item);

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return GestureDetector(
      onTap: () {
        openShowDetails();
      },
      child: Container(
        width: 93,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ShimmerImage(
                item.photo,
                width: 93,
                height: 124,
                fit: BoxFit.cover,
              ),
            ),
            WidgetSpacer(height: 4),
            Text(
              item.title,
              style: FONT_CONST.REGULAR_BLACK2_12,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            WidgetSpacer(height: 2),
            Row(
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: COLOR_CONST.DEFAULT,
                  size: 14,
                ),
                WidgetSpacer(width: 6),
                Text('${item.likePercent}%', style: FONT_CONST.REGULAR_GRAY6_10)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openShowDetails() {
    Navigator.pushNamed(_context, AppRouter.SHOW_INFO, arguments: item.show);
  }
}

class _ItemRecommendedSeatVM {
  late String photo;
  late String title;
  late int likePercent;
  Show show;

  _ItemRecommendedSeatVM.fromShow(this.show) {
    photo = show.thumb;
    title = show.name;
    likePercent = show.rate;
  }
}
