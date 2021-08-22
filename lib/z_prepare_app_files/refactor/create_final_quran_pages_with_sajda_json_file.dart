import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page_content.dart';
import 'package:muslim_guide/z_prepare_app_files/model/old_quran_page/old_quran_page.dart';
import 'package:muslim_guide/z_prepare_app_files/model/returned_quran_pages.dart';
import 'package:muslim_guide/z_prepare_app_files/refactor/qraun_pages_with_sajda.dart';
import 'package:muslim_guide/z_prepare_app_files/refactor/create_quran_page_content_with_headers_util.dart';

const String _saveNewSinglePageContent =
    'lib/z_prepare_app_files/json_files/complete_quran_page.json';

const String _finalQuranPage =
    'lib/z_prepare_app_files/final_json/final_quran_page.json';
Future<void> main() async {
  var quranPage = await _getNewQuranPage();
  // await _writeToFile(jsonEncode(quranPage), _saveNewSinglePageContent);
  await _writeToFile(jsonEncode(quranPage), _finalQuranPage);
}

Future<void> _writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);

// return all raw quran page without any modification
Future<Data> _getData(int page) async {
  final dataResponse = await get(
      Uri.parse('http://api.alquran.cloud/v1/page/$page/quran-uthmani'));

  final decodeData = jsonDecode(dataResponse.body) as Map<String, dynamic>;

  final pages = OriginalQuranPages.fromJson(decodeData);

  return pages.data!;
}

Future<List<QuranPage>> _getNewQuranPage() async {
  var h = 'storeData() >>';

  final newQuranPages = <QuranPage>[];

  // for add custom quran page with sajda
  final pagesWithSajda = await getQuranPagesWithSajda();
  final pagesNumberList = await pagesNumbersWithSajda(pagesWithSajda);

  // loop for every page
  // choose range
  for (var i = 1; i <= 604; i++) {
    // for (var i = 1; i <= 604; i++) {
    print('i= $i');

    var data = await (_getData(i));
    var hizbQuarter = _hizbQuarterMap(data.ayahs!.last.hizbQuarter!);

    var quranPage = OldQuranPage(
      hizb: hizbQuarter['hizb'],
      juz: data.ayahs!.last.juz,
      pageAyahs: data.ayahs!
          .map((ayah) => Ayah(
                surahName: ayah.surah!.name,
                ayahNumber: ayah.numberInSurah,
                ayahText: ayah.text,
                surahNumber: ayah.surah!.number,
              ))
          .toList(),
      pageNumber: data.pageNumber,
      quarter: hizbQuarter['quarter'],
      surahName: data.surahs![data.surahs!.keys.last]!.name,
    );

    // ########### COMMENT ###############3
    // create custom page
    final quranPageContents = buildCompleteQuranPage(quranPage);

    final quranPageContentsStr = jsonEncode(quranPageContents);

    var pageContentList = quranPageContentFromJson(quranPageContentsStr);
    final newQuranPage;
    if (pagesNumberList.contains(i)) {
      final curPageWithSajda =
          pagesWithSajda.firstWhere((e) => e.pageNumber == i);
      newQuranPage = newQuranPage = QuranPage().fromQuranPage(
        quranPage: quranPage,
        quranPageContents: pageContentList,
        sajdaType: curPageWithSajda.sajdaType,
        sajdaIndex: curPageWithSajda.sajdaIndex,
        ayahContent: curPageWithSajda.ayahContent,
      );
    } else {
      newQuranPage = QuranPage().fromQuranPage(
        quranPage: quranPage,
        quranPageContents: pageContentList,
      );
    }
    newQuranPages.add(newQuranPage);
    // ########### COMMENT ###############3

  }
  return newQuranPages;
}

Map<String, int?> _hizbQuarterMap(int num) {
  var h = 'hizbQuarterMap() >>';

  // 40 / 4 >> 10.0
  // 41 / 4 >> 10.25
  // 42 / 4 >> 10.50
  // 43 / 4 >> 10.75
  var quarterHizb = num / 4;
  var hizb = int.parse(quarterHizb.toString().split('.')[0]);
  var quarter = int.parse(quarterHizb.toString().split('.')[1]);
  var quarterRes;
  switch (quarter) {
    case 0:
      quarterRes = 4;
      break;
    case 25:
      quarterRes = 1;
      break;
    case 5:
      quarterRes = 2;
      break;
    case 75:
      quarterRes = 3;
      break;
  }
  hizb = (quarter > 0) ? hizb + 1 : hizb;

  return <String, int?>{'hizb': hizb, 'quarter': quarterRes};
}

extension on QuranPage {
  QuranPage fromQuranPage({
    required OldQuranPage quranPage,
    List<QuranPageContent>? quranPageContents,
    AyahContent? ayahContent,
    int? sajdaIndex,
    SajdaType? sajdaType,
  }) {
    return QuranPage(
      pageNumber: quranPage.pageNumber,
      juz: quranPage.juz,
      quarter: quranPage.quarter,
      hizb: quranPage.hizb,
      surahName: quranPage.surahName,
      quranPageContents: quranPageContents,
      ayahContent: ayahContent,
      sajdaIndex: sajdaIndex,
      sajdaType: sajdaType,
    );
  }
}
