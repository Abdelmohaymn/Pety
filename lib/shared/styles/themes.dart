
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData(

  scaffoldBackgroundColor: ColorManager.backgroundBlue,
  //primaryColor: ColorManager.defaultColor,
  colorScheme: ColorScheme.fromSeed(
      seedColor: ColorManager.defaultColor,
      brightness: Brightness.light
  ).copyWith(
    primary: ColorManager.defaultColor,
    secondary: ColorManager.defaultColor,
  ),
  appBarTheme: const AppBarTheme(
    surfaceTintColor: Colors.white,
    titleSpacing: 20,
    color: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: Colors.white
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorManager.defaultColor
  ),
  textTheme: const TextTheme(
      labelSmall: TextStyle(
          fontSize: 15,
          color: Colors.grey
      ),
      labelMedium: TextStyle(
          color: Colors.white
      ),
      titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
      )
  ),
  //fontFamily: 'Janna',
);
