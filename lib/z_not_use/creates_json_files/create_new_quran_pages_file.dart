// FIXME: m

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page_content.dart';
import 'package:muslim_guide/z_not_use/creates_json_files/create_quran_page_contents_file.dart';
import 'package:muslim_guide/z_not_use/model/old_quran_page/quran_page.dart';
import 'package:muslim_guide/z_not_use/model/returned_quran_pages.dart';

/// responsible for create json object and save it in file [newQuranPagesFile]
Future<void> main() async {
  var x = await _getNewQuranPage();
  // await _writeToFile(jsonEncode(x), 'test_file.json');
  await _writeToFile(jsonEncode(x), newQuranPagesFile);
}

Future<Data> _getData(int page) async {
  final dataResponse = await get(
      Uri.parse('http://api.alquran.cloud/v1/page/$page/quran-uthmani'));

  final decodeData = jsonDecode(dataResponse.body) as Map<String, dynamic>;

  final pages = OriginalQuranPages.fromJson(decodeData);

  return pages.data;
}

Future<List<QuranPage>> _getNewQuranPage() async {
  var h = 'storeData() >>';

  final newQuranPages = <QuranPage>[];

  for (var i = 1; i <= 604; i++) {
    // for (var i = 1; i <= 3; i++) {
    print('i= $i');

    var data = await _getData(i);
    var hizbQuarter = _hizbQuarterMap(data.ayahs.last.hizbQuarter);

    var quranPage = OldQuranPage(
      hizb: hizbQuarter['hizb'],
      juz: data.ayahs.last.juz,
      pageAyahs: data.ayahs
          .map((ayah) => Ayah(
                surahName: ayah.surah.name,
                ayahNumber: ayah.numberInSurah,
                ayahText: ayah.text,
                surahNumber: ayah.surah.number,
              ))
          .toList(),
      pageNumber: data.pageNumber,
      quarter: hizbQuarter['quarter'],
      surahName: data.surahs[data.surahs.keys.last].name,
    );

    final quranPageContents = await getQuranPageContent(quranPage);

    final quranPageContentsStr = jsonEncode(quranPageContents);

    // FIXME: m
    /*   var pageContentList = quranPageContentFromJson(quranPageContentsStr);

    // fixme: remove comment in order to make this method work
    final newQuranPage = QuranPage().fromQuranPage(
      quranPage: quranPage,
      quranPageContents: pageContentList,
    );

    newQuranPages.add(newQuranPage);*/
  }
  return newQuranPages;
}

extension on QuranPage {
  QuranPage fromQuranPage({
    OldQuranPage quranPage,
    List<QuranPageContent> quranPageContents,
  }) {
    return QuranPage(
      pageNumber: quranPage.pageNumber,
      juz: quranPage.juz,
      quarter: quranPage.quarter,
      hizb: quranPage.hizb,
      surahName: quranPage.surahName,
      quranPageContents: quranPageContents,
    );
  }
/*  My.fromQuranPage(
      {QuranPage quranPage, List<QuranPageContent> quranPageContents})
      : this(
    pageNumber: quranPage.pageNumber,
    juz: quranPage.juz,
    quarter: quranPage.quarter,
    hizb: quranPage.hizb,
    surahName: quranPage.surahName,
    quranPageContents: quranPageContents,
  );*/
}

Future<void> _writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);

Map<String, int> _hizbQuarterMap(int num) {
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

  return <String, int>{'hizb': hizb, 'quarter': quarterRes};
}
