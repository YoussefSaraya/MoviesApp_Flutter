import 'package:flutter/material.dart';
import 'package:movies/app_colors.dart';
class MyThemeData {
  ///colors,light mode and dark mode themes
  static final ThemeData lightTheme = ThemeData(
    canvasColor: AppColors.primaryColor,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)
          )
        ),
        iconTheme: IconThemeData(color: AppColors.primaryColor)),

    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.lightgreyColor),
      bodyMedium: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: AppColors.lightgreyColor),
      bodySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.lightgreyColor),
      titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: AppColors.lightgreyColor),
    ),
  );
}