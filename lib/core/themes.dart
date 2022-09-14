import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue,
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      color: Colors.black,
    ),
    headline5: TextStyle(
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('57504F'),
  primaryColor: Colors.blue,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor:  Colors.white,
      statusBarIconBrightness: Brightness.light,
    ),
    color: HexColor('57504F'),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 17.0,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('57504F'),
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      color: Colors.white,
    ),
    headline5: TextStyle(
      color: Colors.white,
    ),
  ),
);
