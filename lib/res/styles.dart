import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';

TextTheme buildAppTextTheme() => TextTheme(
//      headline1: TextStyle(
//        fontSize: 96,
//        fontWeight: FontWeight.w300,
//        letterSpacing: -1.5,
//        fontFamily: 'Roboto',
//      ),
      headline1: TextStyle(
        fontSize: 18,
        height: 23 / 18,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
      ),
//      headline2: TextStyle(
//        fontSize: 60,
//        fontWeight: FontWeight.w300,
//        letterSpacing: -0.5,
//        fontFamily: 'Roboto',
//      ),
      headline2: TextStyle(
        fontSize: 17,
        height: 22 / 17,
        fontFamily: 'Roboto',
        color: AppColors.black,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
        letterSpacing: -0.41,
      ),
//      headline3: TextStyle(
//        fontSize: 48,
//        fontWeight: FontWeight.w400,
//        fontFamily: 'Roboto',
//      ),
      headline3: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        color: AppColors.manatee,
        fontWeight: FontWeight.normal,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        letterSpacing: 0.25,
      ),
//      headline4: TextStyle(
//        fontSize: 34,
//        fontWeight: FontWeight.w400,
//        letterSpacing: 0.25,
//        fontFamily: 'Roboto',
//      ),
      headline4: TextStyle(
        fontSize: 14,
        height: 16 / 14,
        color: AppColors.alto,
        fontWeight: FontWeight.w600,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
        letterSpacing: 0.75,
      ),
//      headline5: TextStyle(
//        fontSize: 24,
//        fontWeight: FontWeight.w400,
//        fontFamily: 'Roboto',
//      ),
      headline5: TextStyle(
        fontSize: 13,
        height: 18 / 13,
        fontWeight: FontWeight.normal,
        color: AppColors.black,
        fontStyle: FontStyle.normal,
        fontFamily: 'Roboto',
      ),
//      headline6: TextStyle(
//        fontSize: 20,
//        fontWeight: FontWeight.w500,
//        letterSpacing: 0.15,
//        fontFamily: 'Roboto',
//      ),
      headline6: TextStyle(
        fontSize: 12,
        height: 20 / 12,
        letterSpacing: -0.24,
        fontWeight: FontWeight.w300,
        fontFamily: 'Roboto',
        fontStyle: FontStyle.normal,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: 'Roboto',
      ),
      subtitle2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        fontFamily: 'Roboto',
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'Roboto',
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamily: 'Roboto',
      ),
      button: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        fontFamily: 'Roboto',
      ),
      caption: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        fontFamily: 'Roboto',
      ),
      overline: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        fontFamily: 'Roboto',
      ),
    );
