import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.deepOrange ,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,),

  scaffoldBackgroundColor: Colors.white,

  appBarTheme: AppBarTheme(
    surfaceTintColor: Colors.white,
    actionsIconTheme: IconThemeData(color: Colors.deepOrange),
    backgroundColor: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    elevation: 1,
    backgroundColor: Colors.white,
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 19,
      fontWeight: FontWeight.bold,
    ),
  ),
);
