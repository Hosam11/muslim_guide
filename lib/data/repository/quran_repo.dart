import 'dart:convert' as convert;
import 'package:fimber/fimber.dart';
import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/helpers/app_helper.dart';

// ignore: prefer_const_constructors

class QuranRepo {
  static final QuranRepo instance = QuranRepo._privateConstructor();
  QuranRepo._privateConstructor();

/*
  Future<List<QuranPage>> getQuranPages() async {
    var h = '@@ $runtimeType @@ getQuranPages() >>';
    final quranPagesRes = await rootBundle.loadString(quranPagesFile);

    final quranData = quranDataFromJson(quranPagesRes);
    mLog('$h quranData= ${convert.jsonEncode(quranData)}');

    return quranData;
  }*/

}
