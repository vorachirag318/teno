import 'package:flutter/material.dart';
import 'package:teno/core/constant/app_colors.dart';
import 'package:teno/core/utils/globle.dart';

class AppTheme {
  static final ThemeData defTheme = ThemeData(
      scaffoldBackgroundColor: AppColor.backgroundColor,
      textTheme: const TextTheme(
          bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontFamily: Font.kRifficFree,
      )));
}
