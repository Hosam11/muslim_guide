import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';

class SurahRepo {
  static final SurahRepo instance = SurahRepo._privateConstructor();

  SurahRepo._privateConstructor();

  Future<List<Surah>> getSurahList() async {
    final surahsStr = await rootBundle.loadString(surahsList);
    return surahListFromJson(surahsStr);
  }
}
