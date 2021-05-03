import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF085154);

const TextStyle kScreenTitleStyle = TextStyle(
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);

const Color kSecondaryColor = Color(0xFF1F6265);

const BoxDecoration kBackgroundBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        Color(0xFFE4F1F5),
        Color(0xFFEFF8FA),
      ],
      begin: FractionalOffset(0.0, 0.0),
      end: FractionalOffset(1.0, 0.0),
      // stops: [0.0, 1.0],
      stops: [0.0, 0.1],
      tileMode: TileMode.mirror),
);
