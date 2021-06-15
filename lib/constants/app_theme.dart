import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/fonts.dart';

/*
final ThemeData appThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  accentColor: kAccentColor,
  fontFamily: tajawalReg,
  textTheme: TextTheme().copyWith(
    headline5: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
    headline6: TextStyle(color: kTextColor),
    subtitle1: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
  ),
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1.0,
    */
/* endIndent: dividerIntent,
              indent: dividerIntent, */ /*

  ),
  // This makes the visual density adapt to the platform that you run
  // the app on. For desktop platforms, the controls will be smaller and
  // closer together (more dense) than on mobile platforms.
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
*/

// not used only for practicing
const _lightFillColor = Colors.black;
final ColorScheme lightColorScheme = ColorScheme(
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
