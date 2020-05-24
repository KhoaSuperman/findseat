import 'package:find_seat/presentation/custom_ui/custom_ui.dart';
import 'package:find_seat/presentation/screen/home/home_banner/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WidgetHomeBanner extends StatefulWidget {
  @override
  _WidgetHomeBannerState createState() => _WidgetHomeBannerState();
}

class _WidgetHomeBannerState extends State<WidgetHomeBanner> {
  final aspectRatioBanner = 16 / 9;
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
      builder: (context, state) {
        if (state is HomeBannerLoaded) {
          return Container(
            child: _buildCarouselSlider(state),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildCarouselSlider(HomeBannerLoaded state) {
    return Stack(
      children: <Widget>[
        CarouselSlider(
          aspectRatio: aspectRatioBanner,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          pauseAutoPlayOnTouch: Duration(seconds: 10),
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: state.banners.map((banner) {
            return ShimmerImage(
              banner.url,
              fit: BoxFit.contain,
              aspectRatio: aspectRatioBanner,
              iconHolderSize: 56,
            );
          }).toList(),
        ),
        _buildIndicators(state),
      ],
    );
  }

  _buildIndicators(HomeBannerLoaded state) {
    return Positioned(
      left: 12,
      right: 0,
      bottom: 12,
      child: Container(
        child: WrapContentHozListView(
          list: state.banners,
          itemBuilder: (context, index) {
            return _buildIndicatorNormal(currentIndex == index);
          },
        ),
      ),
    );
  }

  _buildIndicatorNormal(bool isSelected) {
    return Container(
      height: isSelected ? 5 : 4,
      width: isSelected ? 18 : 16,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isSelected ? COLOR_CONST.WHITE : COLOR_CONST.WHITE_50,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
