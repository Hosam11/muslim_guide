import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';

const String _compeletQuranPageFile =
    'lib/z_prepare_app_files/json_files/complete_quran_page.json';

const String _quranPAgeWithSajdaFiles =
    'lib/z_prepare_app_files/final_json/quran_page_with_sajda.json';

late final List<int> quranPageNumbersWithSajda;

Future<void> main() async {
  // final compeletQuranPageJson = quranPagesFromJson(jsonEncode(compeletQuranPage));

  // final compeletPage = await getCompleteQuranPage();
  // await assignQuranWithSajdaToQuranPage(compeletPage);
  // write to file
  // await _writeToFile(jsonEncode(compeletPage), _finalQuranPage);
}

// List<PrayerTimesCard> get prayersCardWidget => _prayersCardWidget;

Future<List<int>> pagesNumbersWithSajda(List<QuranPage> pages) async {
  return pages.map((e) => e.pageNumber!).toList(growable: false);
}

/// return list of 15 element that contain content with sajda
Future<List<QuranPage>> getQuranPagesWithSajda() async {
  final quranPageWithSajda =
      await File(_quranPAgeWithSajdaFiles).readAsString();
  final quranPageWithSajdaData = quranDataFromJson(quranPageWithSajda);
  return quranPageWithSajdaData;
}

/*
Future<void> _writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);
*/

/*
Future<List<QuranPage>> getCompleteQuranPage() async {
  var h = 'getCompleteQuranPage() >> ';

  final completeQuranPage = await File(_compeletQuranPageFile).readAsString();
  final quranPages = quranDataFromJson(completeQuranPage);
  print('$h quranPagesLen= ${quranPages.length}');
  return quranPages;
}
*/

/*
Future<void> assignQuranWithSajdaToQuranPage(List<QuranPage> pages) async {
  var h = 'assignQuranWithSajdaToQuranPage() >> ';

  final quranPageWithSajdaData = await getQuranPagesWithSajda();
  print('$h quranPageWithSajdaData= ${quranPageWithSajdaData.length}');
  final x = quranPageWithSajdaData.map(
    (sajdaPage) {
      final selectedPage = pages.firstWhere(
          (noSajdaPage) => sajdaPage.pageNumber == noSajdaPage.pageNumber);
      print('selectedPage= ${selectedPage.pageNumber}');
      print('sajdaPage = ${sajdaPage.pageNumber}');
      selectedPage.ayahContent = sajdaPage.ayahContent;
      selectedPage.sajdaType = sajdaPage.sajdaType;
      selectedPage.sajdaIndex = sajdaPage.sajdaIndex;
    },
  ).toList();

  print('$x');
}
*/
