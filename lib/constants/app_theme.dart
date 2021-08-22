import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/constants_imports.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  accentColor: kAccentColor,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: elevation,
      backgroundColor: kPrimaryColor,
      side: const BorderSide(color: kTextColor),
    ),
  ),
  textTheme: GoogleFonts.tajawalTextTheme().copyWith(
    headline5: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
    headline6:
        const TextStyle(color: kTextColor, fontWeight: FontWeight.normal),
    headline4: const TextStyle(color: kTextColor),
    headline1: const TextStyle(color: kTextColor),
    headline3: const TextStyle(color: kTextColor),
    headline2: const TextStyle(color: kTextColor),
    subtitle1: const TextStyle(color: kTextColor),
    subtitle2: const TextStyle(color: kTextColor),
    bodyText1: const TextStyle(color: kTextColor),
    bodyText2: const TextStyle(color: kTextColor),
    caption: const TextStyle(color: kTextColor),
  ), // .apply(bodyColor: kTextColor, displayColor: Colors.blue),
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1.0,
    color: kTextColor,
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

// not used only for practicing
const _lightFillColor = Colors.black;
final ColorScheme lightColorScheme = const ColorScheme(
  primary: Color(0xFFB93C5D),
  primaryVariant: Color(0xFF117378),
  secondary: Color(0xFFEFF3F3),
  secondaryVariant: Color(0xFFFAFBFB),
  background: Color(0xFFE6EBEB),
  surface: Color(0xFFFAFBFB),
  onBackground: kTextColor,
  error: _lightFillColor,
  onError: _lightFillColor,
  onPrimary: _lightFillColor,
  onSecondary: Color(0xFF322942),
  onSurface: Color(0xFF241E30),
  brightness: Brightness.light,
);
