import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/shared/styles/colors.dart';


ThemeData darkTheme = ThemeData(
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: const Color.fromRGBO(51, 55, 55, 1),
  primarySwatch: defaultColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Color.fromRGBO(51, 55, 55, 1),
    iconTheme: IconThemeData(color: Colors.white),
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(51, 55, 55, 1),
      statusBarIconBrightness: Brightness.light,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(51, 55, 55, 1),
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
  ),

  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      height: 1.3,
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  fontFamily: 'Jannah',
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: defaultColor,
  appBarTheme: const AppBarTheme(
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: defaultColor,
      type: BottomNavigationBarType.fixed,
      elevation: 20.0),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      height: 1.3,
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  ),
);
