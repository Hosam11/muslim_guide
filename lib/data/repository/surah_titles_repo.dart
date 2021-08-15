import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';

Future<List<Surah>> getSurahTitles() async {
  final surahsStr = await rootBundle.loadString(surahsTitlesFile);
  // solved

  return surahListFromJson(surahsStr);
}
