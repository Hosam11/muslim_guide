import 'dart:convert' as convert;
import 'package:fimber/fimber.dart';
import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/quran_page/quran_page.dart';
import 'package:muslim_guide/helpers/app_helper.dart';

// ignore: prefer_const_constructors

class QuranRepo {
  static final QuranRepo instance = QuranRepo._privateConstructor();
  QuranRepo._privateConstructor();

  // List<dynamic> quranPages;

/*
  Future<void> getPages() async {
    final pagesRes = await rootBundle.loadString(quranPagesFile);
    */
/*
     pagesList is NOT analysis_options.yaml string it's List<dynamic> "List of [QuranPage]"
     to access element in it you can type pagesList[0]['pageNumber']
     */ /*

    final pagesList = await convert.jsonDecode(pagesRes) as List<dynamic>;

    QuranRepo.instance.quranPages = pagesList;

    // print('pagesList=  $pagesList');
    // print('pagesList[0]=  ${pagesList[0]['ayahNumberMap']}');
  }
*/

  Future<List<QuranPage>> getQuranPages() async {
    var h = '@@ $runtimeType @@ getQuranPages() >>';
    final quranPagesRes = await rootBundle.loadString(quranPagesFile);

    final quranData = quranDataFromJson(quranPagesRes);
    mLog('$h quranData= ${convert.jsonEncode(quranData)}');

    return quranData;
  }

/*  Future<List<QuranPage>> getNewQuranPages() async {
    var h = '@@ $runtimeType @@ getQuranPages() >>';
    final quranPagesRes = await rootBundle.loadString(quranPagesFile);

    final quranData = quranDataFromJson(quranPagesRes);
    // mLog('$h quranData= ${convert.jsonEncode(quranData)}');

    return quranData;
  }*/
/*

  String getQuranPage(int page) {
    if (quranPages != null) {
      final Map<String, dynamic> ayahTexMap =
          quranPages[page - 1]['ayahNumberMap'] as Map<String, dynamic>;
      // print('ayahTexMap= $ayahTexMap');

      final List<String> ayahs = [];

      ayahTexMap.forEach((ayahNumber, ayahText) {
        ayahs.add(
            '$ayahText \uFD3F${ArabicHelper.arabicNumber.convert(ayahNumber)}\uFD3E ');
      });
      final pageString = ayahs.join();
      Fimber.i('pageString= $pageString');
      return pageString;
    } else {
      return '';
    }
  }
*/

/*  List<String> getListOfAyahs(int page) {
    final Map<String, dynamic> ayahTexMap =
        quranPages[page - 1]['ayahNumberMap'] as Map<String, dynamic>;
    // print('ayahTexMap= $ayahTexMap');

    final List<String> ayahs = [];

    ayahTexMap.forEach((ayahNumber, ayahText) {
      ayahs.add(
          '$ayahText\uFD3F${ArabicHelper.arabicNumber.convert(ayahNumber)}\uFD3E');
    });
    return ayahs;
    */ /* Fimber.i('pageString= $pageString');
      return pageString;*/ /*
  }*/

}
