import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/helpers/app_helper.dart';

class AppRepo {
  static final AppRepo instance = AppRepo._privateConstructor();

  AppRepo._privateConstructor();

  Future<List<Surah>> getSurahList() async {
    final surahsStr = await rootBundle.loadString(surahsListFile);
    return surahListFromJson(surahsStr);
  }

  Future<List<Surah>> getSurahHeaders() async {
    final surahsStr = await rootBundle.loadString(surahsHeadersFile);
    return surahListFromJson(surahsStr);
  }

  Future<List<NewQuranPage>> getQuranPages() async {
    var h = '@@ $runtimeType @@ getQuranPages() >>';
    final quranPagesRes = await rootBundle.loadString(newQuranPagesFile);
    final quranData = quranDataFromJson(quranPagesRes);
    mLog('$h quranData= ${jsonEncode(quranData)}');
    final methodName = StackFrame.fromStackTrace(StackTrace.current)[0].method;
    Fimber.i('methodName= $methodName  ');
    return quranData;
  }
}
