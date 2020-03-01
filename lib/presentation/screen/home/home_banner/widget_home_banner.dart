import 'package:find_seat/presentation/screen/home/home_banner/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
      builder: (context, state) {
        if (state is HomeBannerLoaded) {
          return Container(
            child: Image.asset(
              "images/banner1.png",
              fit: BoxFit.contain,
            ),
          );
        } else if (state is HomeBannerNotLoaded) {
          return Center(
            child: Text('No banner here'),
          );
        } else {
          return Text('Unknown state');
        }
      },
    );
  }
}
