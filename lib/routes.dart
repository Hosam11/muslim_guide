import 'package:flutter/material.dart';
import 'package:muslim_guide/screens/home_screen.dart';
import 'package:muslim_guide/screens/quran_screen.dart';
import 'package:muslim_guide/screens/surah_screen.dart';

const String homeScreen = 'home_screen';
const String quranScreen = 'quran_screen';
const String surahScreen = 'surah_screen';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  homeScreen: (BuildContext context) => HomeScreen(),
  quranScreen: (BuildContext context) => QuranScreen(),
  surahScreen: (context) => SurahScreen(),
};
