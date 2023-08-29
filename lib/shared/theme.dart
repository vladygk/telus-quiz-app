import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var purple = const Color.fromRGBO(75, 40, 109, 1);
var darkPurple = const Color.fromRGBO(75, 40, 109, 1.5);
var green = const Color.fromRGBO(102, 204, 0, 1);

var appTheme = ThemeData(
    fontFamily: GoogleFonts.roboto().fontFamily,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: purple,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: purple, foregroundColor: Colors.white)),
    appBarTheme: AppBarTheme(backgroundColor: green),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: green));

var colorScheme = ColorScheme(
    background: purple,
    brightness: Brightness.light,
    primary: green,
    onPrimary: Colors.white,
    secondary: purple,
    onSecondary: green,
    error: Colors.red.shade400,
    onError: Colors.black,
    onBackground: green,
    surface: darkPurple,
    onSurface: Colors.white);
