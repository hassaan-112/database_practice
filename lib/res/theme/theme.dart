import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppTheme{



  ThemeData light =ThemeData(
  fontFamily: "Poppins",
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
  displayLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.black),
  displayMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal, color: Colors.black),
  displaySmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal, color: Colors.black),
  headlineLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.black),
  headlineMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.black),
  bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.black),
  bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.black),
  bodySmall: TextStyle(fontSize: 12.sp, color: Colors.black),
  ),
  appBarTheme: AppBarTheme(
  backgroundColor: Colors.blue,
  foregroundColor: Colors.white,
  titleTextStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
  ),
  );

  ThemeData dark =ThemeData(
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.white),
      displayMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.normal, color: Colors.white),
      displaySmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal, color: Colors.white),
      headlineLarge: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: Colors.white),
      headlineMedium: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14.sp, color: Colors.white),
      bodySmall: TextStyle(fontSize: 12.sp, color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );

}