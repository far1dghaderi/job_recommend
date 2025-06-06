import 'package:flutter/material.dart';
import 'package:job_recommender/utils/colors.dart';


class CustomTheme {

  static ThemeData theme = ThemeData(
    primaryColor: CustomeColors.kPrimaryColor,
    scaffoldBackgroundColor: CustomeColors.kBackgroundColor,
    dialogBackgroundColor: CustomeColors.kBackgroundTextFiedlColor,
    colorScheme: _colorScheme,
    fontFamily: 'vazirmatn',
  );


  static const ColorScheme _colorScheme = ColorScheme(
      primary: CustomeColors.kPrimaryColor,
      secondaryContainer: CustomeColors.kContainerColor,
      secondary: CustomeColors.kSecondaryColor,
      surface: CustomeColors.kBackgroundColor,
      error: CustomeColors.kErrorColor,
      onPrimary: Color(0xffCDDBE7),
      onSecondary: Colors.black,
      onSurface: CustomeColors.kSecondTextColor,
      onError: Colors.white,
      brightness: Brightness.light,
      inverseSurface: CustomeColors.kPrimaryButtonBackgroundColor,
      tertiary: CustomeColors.kMainTextColor
    );

}