import 'package:flutter/material.dart';

class MyTheme {
  static Color black = Color(0xff121312);
  static Color white = Color(0xffffffff);
  static Color grey = Color(0xff282A28);
  static Color borderGrey = Color(0xff707070);
  static Color primaryColor = Color(0xffF7B539);
  static Color selectedYellow = Color(0xffFFBB3B);
  static Color lightGrey = Color(0xffB5B4B4);
  static Color bottomNavBarColor = Color(0xff1A1A1A);


  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: grey,
        selectedItemColor: selectedYellow,
        selectedIconTheme: IconThemeData(color: selectedYellow),
        showSelectedLabels: true,
        showUnselectedLabels: true),

    textTheme: TextTheme(
      titleLarge:
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: white),
      titleMedium:
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: black),
      titleSmall:
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: black),
    ),
  );
}