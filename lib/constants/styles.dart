import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';

const TextStyle kScreenTitleStyle = TextStyle(
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);

const BoxDecoration kBackgroundBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      kFirstGradientColor,
      kSecondGradientColor,
    ],
    begin: FractionalOffset(0.0, 0.0),
    end: FractionalOffset(1.0, 0.0),
    // stops: [0.0, 1.0],
    stops: [0.0, 0.1],
    tileMode: TileMode.mirror,
  ),
);
