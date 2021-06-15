import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/helpers/arabic_numbers.dart';

enum QuranContentType { surahHeader, ayah }

class QuranHelper {
  QuranHelper._();

  static final QuranHelper instance = QuranHelper._();
  final QuranRepo _quranRepo = QuranRepo.instance;
  final List<Map<QuranContentType, dynamic>> dd = [];

  List<Map<QuranContentType, dynamic>> get pageContent => dd;

  Future<void> prepareQuranPageContents() async {
    final quranPages = await _quranRepo.getQuranPages();
    for (var pageIndex = 0; pageIndex < quranPages.length; pageIndex++) {
      final page = quranPages[pageIndex];
      for (var ayahIndex; ayahIndex < page.pageAyahs.length; ayahIndex++) {
        final ayah = page.pageAyahs[ayahIndex];
      }
    }
  }

  Future<void> testPrepareQuranPageContents(int quranPageIndex) async {
    final pageContent = <Map<String, String>>[];

    final quranPages = await _quranRepo.getQuranPages();
    final page = quranPages[quranPageIndex];
    Fimber.i('');
    mLog('page= ${jsonEncode(page)}');
    final ayahLen = page.pageAyahs.length;
    Fimber.i('ayahLen= $ayahLen');
    var isAyahsSaved = false;
    for (var ayahIndex = 0; ayahIndex < ayahLen; ayahIndex++) {
      final ayah = page.pageAyahs[ayahIndex];
      Fimber.i('ayah= ${jsonEncode(ayah)}');
      final firstSurahNumber = ayah.surahNumber;
      final nextSurahNumber = ayahIndex < ayahLen
          ? page.pageAyahs[ayahIndex + 1].surahNumber
          : page.pageAyahs[ayahIndex].surahNumber;

      final ayahBuffer = StringBuffer();
      // same surah
      if (firstSurahNumber == nextSurahNumber) {
        // create header
        addHeaderToMap(pageContent, ayah);
        // append text to stringBuffer object
        addAyahToBuffer(ayahBuffer, ayah);
      } else {
        // add buffer to mapObj
        isAyahsSaved = true;
        addAyahToMap(pageContent, ayah);
        // clear buffer
        ayahBuffer.clear();
        // create new header
        addHeaderToMap(pageContent, ayah);
        // append text to stringBuffer object
        addAyahToBuffer(ayahBuffer, ayah);
      }
      if (!isAyahsSaved) {
        addHeaderToMap(pageContent, ayah);
      }
    }
    mLog(jsonEncode(pageContent));
  }

  void addAyahToBuffer(StringBuffer buffer, Ayah ayah) => buffer.write(
      '${ayah.ayahText} \uFD3F${convertToArabic(ayah.ayahNumber)}\uFD3E ');

  void addAyahToMap(
    List<Map<String, String>> pageContent,
    Ayah ayah,
  ) {
    var ayahMap = {contentType[QuranContentType.ayah]: ayah.ayahText};
    pageContent.add(ayahMap);
  }

  void addHeaderToMap(
    List<Map<String, String>> pageContent,
    Ayah ayah,
  ) {
    var header = {contentType[QuranContentType.surahHeader]: ayah.surahName};
    Fimber.i('header= $header');
    mLog('pageContentMap= $pageContent');

    if (pageContent.isNotEmpty) {
      for (final content in pageContent) {
        Fimber.i('contentToString= ${content.toString()}');
        Fimber.i('headerToString= ${header.toString()}');
        final isExist = content.toString() == header.toString();
        Fimber.i('isExist= $isExist');

        if (!isExist) {
          pageContent.add(header);
          break;
        }
      }
    }
  }
}

const contentType = {
  QuranContentType.surahHeader: 'header',
  QuranContentType.ayah: 'ayah'
};
