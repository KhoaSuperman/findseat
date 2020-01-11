import 'package:flutter/material.dart';

import 'COLOR_CONST.dart';

class FONT_CONST {
  static final REGULAR = TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: COLOR_CONST.BLACK);

  static final MEDIUM = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: COLOR_CONST.BLACK,
  );

  static final SEMIBOLD = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: COLOR_CONST.BLACK,
  );

  //REGULAR
  static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.DEFAULT);
  static final REGULAR_DEFAULT_10 = REGULAR_DEFAULT.copyWith(fontSize: 10);
  static final REGULAR_DEFAULT_12 = REGULAR_DEFAULT.copyWith(fontSize: 12);

  static final REGULAR_WHITE = REGULAR.copyWith(color: COLOR_CONST.WHITE);
  static final REGULAR_WHITE_8 = REGULAR_WHITE.copyWith(fontSize: 8);
  static final REGULAR_WHITE_10 = REGULAR_WHITE.copyWith(fontSize: 10);
  static final REGULAR_WHITE_12 = REGULAR_WHITE.copyWith(fontSize: 12);
  static final REGULAR_WHITE_14 = REGULAR_WHITE.copyWith(fontSize: 14);

  static final REGULAR_GRAY1 = REGULAR.copyWith(color: COLOR_CONST.GRAY1);
  static final REGULAR_GRAY1_10 = REGULAR_GRAY1.copyWith(fontSize: 10);
  static final REGULAR_GRAY1_12 = REGULAR_GRAY1.copyWith(fontSize: 12);

  static final REGULAR_GRAY1_50 = REGULAR.copyWith(color: COLOR_CONST.GRAY1_50);
  static final REGULAR_GRAY1_50_9 = REGULAR_GRAY1_50.copyWith(fontSize: 9);
  static final REGULAR_GRAY1_50_12 = REGULAR_GRAY1_50.copyWith(fontSize: 12);

  static final REGULAR_BLACK2 = REGULAR.copyWith(color: COLOR_CONST.BLACK2);
  static final REGULAR_BLACK2_10 = REGULAR_BLACK2.copyWith(fontSize: 10);
  static final REGULAR_BLACK2_12 = REGULAR_BLACK2.copyWith(fontSize: 12);
  static final REGULAR_BLACK2_14 = REGULAR_BLACK2.copyWith(fontSize: 14);

  static final REGULAR_GRAY4 = REGULAR.copyWith(color: COLOR_CONST.GRAY4);
  static final REGULAR_GRAY4_8 = REGULAR_GRAY4.copyWith(fontSize: 8);
  static final REGULAR_GRAY4_10 = REGULAR_GRAY4.copyWith(fontSize: 10);
  static final REGULAR_GRAY4_12 = REGULAR_GRAY4.copyWith(fontSize: 12);
  static final REGULAR_GRAY4_14 = REGULAR_GRAY4.copyWith(fontSize: 14);

  static final REGULAR_GRAY4_40 = REGULAR.copyWith(color: COLOR_CONST.GRAY4_40);
  static final REGULAR_GRAY4_40_12 = REGULAR_GRAY4_40.copyWith(fontSize: 12);

  static final REGULAR_GRAY5 = REGULAR.copyWith(color: COLOR_CONST.GRAY5);
  static final REGULAR_GRAY5_10 = REGULAR_GRAY5.copyWith(fontSize: 10);

  static final REGULAR_GRAY6 = REGULAR.copyWith(color: COLOR_CONST.GRAY6);
  static final REGULAR_GRAY6_10 = REGULAR_GRAY6.copyWith(fontSize: 10);
  static final REGULAR_GRAY6_12 = REGULAR_GRAY6.copyWith(fontSize: 12);

  static final REGULAR_BLUE = REGULAR.copyWith(color: COLOR_CONST.BLUE);
  static final REGULAR_BLUE_14 = REGULAR_BLUE.copyWith(fontSize: 14);
  static final REGULAR_BLUE_16 = REGULAR_BLUE.copyWith(fontSize: 16);

  //MEDIUM
  static final MEDIUM_WHITE = MEDIUM.copyWith(color: COLOR_CONST.WHITE);
  static final MEDIUM_WHITE_12 = MEDIUM_WHITE.copyWith(fontSize: 12);
  static final MEDIUM_WHITE_14 = MEDIUM_WHITE.copyWith(fontSize: 14);
  static final MEDIUM_WHITE_16 = MEDIUM_WHITE.copyWith(fontSize: 16);
  static final MEDIUM_WHITE_22 = MEDIUM_WHITE.copyWith(fontSize: 22);

  static final MEDIUM_DEFAULT = MEDIUM.copyWith(color: COLOR_CONST.DEFAULT);
  static final MEDIUM_DEFAULT_10 = MEDIUM_DEFAULT.copyWith(fontSize: 10);
  static final MEDIUM_DEFAULT_12 = MEDIUM_DEFAULT.copyWith(fontSize: 12);
  static final MEDIUM_DEFAULT_14 = MEDIUM_DEFAULT.copyWith(fontSize: 14);
  static final MEDIUM_DEFAULT_16 = MEDIUM_DEFAULT.copyWith(fontSize: 16);

  static final MEDIUM_WHITE_70 = MEDIUM.copyWith(color: COLOR_CONST.WHITE_70);
  static final MEDIUM_WHITE_70_14 = MEDIUM_WHITE_70.copyWith(fontSize: 14);

  static final MEDIUM_GRAY4 = MEDIUM.copyWith(color: COLOR_CONST.GRAY4);
  static final MEDIUM_GRAY4_10 = MEDIUM_GRAY4.copyWith(fontSize: 10);

  static final MEDIUM_BLACK2 = MEDIUM.copyWith(color: COLOR_CONST.BLACK2);
  static final MEDIUM_BLACK2_14 = MEDIUM_BLACK2.copyWith(fontSize: 14);
  static final MEDIUM_BLACK2_16 = MEDIUM_BLACK2.copyWith(fontSize: 16);

  static final MEDIUM_BLUE = MEDIUM.copyWith(color: COLOR_CONST.BLUE);
  static final MEDIUM_BLUE_14 = MEDIUM_BLUE.copyWith(fontSize: 14);
  static final MEDIUM_BLUE_16 = MEDIUM_BLUE.copyWith(fontSize: 16);

  //SEMI_BOLD
  static final SEMIBOLD_WHITE = SEMIBOLD.copyWith(color: COLOR_CONST.WHITE);
  static final SEMIBOLD_WHITE_10 = SEMIBOLD_WHITE.copyWith(fontSize: 10);
  static final SEMIBOLD_WHITE_16 = SEMIBOLD_WHITE.copyWith(fontSize: 16);
  static final SEMIBOLD_WHITE_18 = SEMIBOLD_WHITE.copyWith(fontSize: 18);

  //OSWALD
  static final OSWALD_REGULAR = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.w400,
  );

  static final OSWALD_REGULAR_RED2 =
      OSWALD_REGULAR.copyWith(color: COLOR_CONST.RED2);
  static final OSWALD_REGULAR_RED2_12 =
      OSWALD_REGULAR_RED2.copyWith(fontSize: 12);
}
