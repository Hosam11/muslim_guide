import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/fonts.dart';
import 'package:muslim_guide/constants/styles.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  fontFamily: amiriBold,
  dividerTheme: const DividerThemeData(
    space: 0,
    thickness: 1.0,
    /* endIndent: dividerIntent,
              indent: dividerIntent, */
  ),
  // This makes the visual density adapt to the platform that you run
  // the app on. For desktop platforms, the controls will be smaller and
  // closer together (more dense) than on mobile platforms.
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
