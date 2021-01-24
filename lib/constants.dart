import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF085154);

const TextStyle kScreenTitleStyle = TextStyle(
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
);
const BoxDecoration kBackgroundBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        const Color(0xFFE4F1F5),
        const Color(0xFFEFF8FA),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      // stops: [0.0, 1.0],
      stops: [0.0, 0.1],
      tileMode: TileMode.mirror),
);
