import 'package:find_seat/model/entity/categoryy.dart';
import 'package:find_seat/presentation/common_widgets/widget_spacer.dart';
import 'package:find_seat/presentation/custom_ui/svg_image.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/home/home_categories/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeCategories extends StatefulWidget {
  @override
  _WidgetHomeCategoriesState createState() => _WidgetHomeCategoriesState();
}

class _WidgetHomeCategoriesState extends State<WidgetHomeCategories> {
  List<_ItemCategoryVM> items = [
//    _ItemCategoryVM("Movies", "assets/ic_film.svg"),
//    _ItemCategoryVM("Events", "assets/ic_events.svg"),
//    _ItemCategoryVM("Plays", "assets/ic_plays.svg"),
//    _ItemCategoryVM("Sports", "assets/ic_sports.svg"),
//    _ItemCategoryVM("Activity", "assets/ic_activity.svg"),
//    _ItemCategoryVM("Monum", "assets/ic_monum.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCategoryBloc, HomeCategoriesState>(
      builder: (context, state) {
        if (state is HomeCategoriesLoaded) {
          items = state.categories
              .map((category) => _ItemCategoryVM.fromCategory(category))
              .toList();

          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Seat categories'.toUpperCase(),
                    style: FONT_CONST.MEDIUM_BLACK2_14),
                WidgetSpacer(height: 14),
                _buildListCategory(),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _buildListCategory() {
    return Container(
      height: 58,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return _WidgetItemCategory(item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 30);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }
}

class _WidgetItemCategory extends StatelessWidget {
  _ItemCategoryVM item;

  _WidgetItemCategory(this.item);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return GestureDetector(
      onTap: () {
        openAllShows();
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 34,
            height: 34,
            child: Center(
              child: MySvgImage(
                path: item.image,
                width: 28,
                height: 28,
                applyColorFilter: false,
              ),
            ),
          ),
          WidgetSpacer(height: 4),
          Text(item.title, style: FONT_CONST.REGULAR_GRAY6_12),
        ],
      ),
    );
  }

  void openAllShows() {
    Navigator.pushNamed(_context, AppRouter.ALL_SHOWS);
  }
}

class _ItemCategoryVM {
  Categoryy categoryy;
  String image;
  String title;

  _ItemCategoryVM.fromCategory(this.categoryy) {
    image = "assets/${this.categoryy.icon}";
    title = this.categoryy.name;
  }
}
