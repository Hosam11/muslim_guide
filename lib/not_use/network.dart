import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/models/quran_page/quran_page.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/not_use/model/quran_me.dart';
import 'package:muslim_guide/not_use/model/returned_quran_pages.dart';

Future<void> main() async {
  /*var finalObj = await surahWithPageNumber();
  print({'finalObj.length= ${finalObj.length}'});
  var surahPageNumber = List<Map<int, int>>.from(finalObj);
  print('surahPageNumber= $surahPageNumber');
  var surahsReferenceList = await getMetaData();
  print('metaListLen= ${surahsReferenceList.length}');
  final finalSurahList = await setupSurahsWithPageNumber(surahPageNumber);
  print('first= ${jsonEncode(finalSurahList.first)}, '
      'last= ${jsonEncode(finalSurahList.last)}');
*/
}

Future<List<Surah>> setupSurahsWithPageNumber(
  List<Map<int, int>> surahPageNumber,
) async {
  final surahListStr = await File(surahsList).readAsString();
  final surahsDataList = surahListFromJson(surahListStr);

  final newSurahList = <Surah>[];

  for (var i = 0; i < surahPageNumber.length; i++) {
    var surah = surahsDataList[i];

    var pageNumberObj = surahPageNumber[i];
    print('pageNumberObj= $pageNumberObj');
    print('i= $i');
    // err
    var pageNumber = pageNumberObj[i + 1];
    print('pageNumber= $pageNumber');
    surah.surahPageNumber = pageNumber;
    newSurahList.add(Surah.clone(surah));
  }
  await writeToFile(jsonEncode(newSurahList), 'final_surahs_list.json');
  return newSurahList;
}

//fixme: error not used and should be remove
Future<List<QuranPage>> setupFinalQuranPageFile(
  List<Map<int, int>> surahPageNumber,
) async {
  var quranPagesList = await getNewQuranPages();

  final newList = <QuranPage>[];
  for (var i = 0; i < surahPageNumber.length; i++) {
    var quranPage = quranPagesList[i];

    var pageNumberObj = surahPageNumber[i];
    print('pageNumberObj= $pageNumberObj');
    print('i= $i');
    // err
    var pageNumber = pageNumberObj[i + 1];
    print('pageNumber= $pageNumber');
    quranPage.pageNumber = pageNumber;
    // newList.add(QuranPage.clone(quranPage));
  }
  return quranPagesList;
}

Future<Set<Map<int, int>>> surahWithPageNumber() async {
  var quranPagesList = await getNewQuranPages();
  var pageNumberWithSurahNumber = <Map<int, int>>{};

  for (var page in quranPagesList) {
    for (var ayah in page.pageAyahs) {
      addToSet(pageNumberWithSurahNumber, ayah, page.pageNumber);
    }
  }

  return pageNumberWithSurahNumber;
}

Future<List<QuranPage>> getNewQuranPages() async {
  final quranPagesRes = await File(quranPagesFile).readAsString();
  final quranData = quranDataFromJson(quranPagesRes);
  // mLog('$h quranData= ${convert.jsonEncode(quranData)}');
  print('quranDataLen= ${quranData.length}');
  return quranData;
}

void addToSet(Set<Map<int, int>> set, Ayah ayah, int pageNumber) {
  if (set.isNotEmpty) {
    if (!set.any((e) => e.containsKey(ayah.surahNumber))) {
      final pageNumberWithSurahNumber = {ayah.surahNumber: pageNumber};
      set.add(pageNumberWithSurahNumber);
    }
  } else {
    final pageNumberWithSurahNumber = {ayah.surahNumber: pageNumber};
    set.add(pageNumberWithSurahNumber);
  }
}

Future<void> writeObjectToFile(pages) async {
  var quranPagesStr = jsonEncode(pages);

  await File('quran_pages.json').writeAsString(quranPagesStr);
}

Future<void> writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);

Future<Data> getData(int page) async {
  final dataResponse = await get(
      Uri.parse('http://api.alquran.cloud/v1/page/$page/quran-uthmani'));

  final decodeData = jsonDecode(dataResponse.body) as Map<String, dynamic>;
  final pages = OriginalQuranPages.fromJson(decodeData);

  return pages.data;
}

var metaLink = 'http://api.alquran.cloud/v1/meta';

Future<List<SurahsReference>> getMetaData() async {
  print('getMetaData');
  var metaLink = 'http://api.alquran.cloud/v1/meta';

  final dataResponse = await get(Uri.parse(metaLink));

  final decodeData = dataResponse.body;

  final metaModel = metaListFromJson(decodeData);

  var surahResList = metaModel.data.surahs.references;
  /* create our target object for surahList form meta endpoint
  var targetSurahList = <Surah>[];
    for (var surRef in surahResList) {
      var surah = Surah(
        name: surRef.name,
        number: surRef.number,
        numberOfAyahs: surRef.numberOfAyahs,
        revelationType: surRef.revelationType,
      );
      targetSurahList.add(surah);
    }*/
  // await writeToFile(jsonEncode(targetSurahList), 'surahList.json');
  return surahResList;
}

/// get quran data form api convert it to object needed then return quranPages
/// list that can be saved in file
Future<List<QuranPage>> storeData() async {
  var head = 'storeData() >>';
  var quranPages = <QuranPage>[];
  for (var i = 1; i <= 604; i++) {
    print('i= $i');

    var data = await getData(i);
//    print('$head data= $data');
    var hizbQuarter = hizbQuarterMap(data.ayahs.last.hizbQuarter);
    //   Fimber.i('hizbQuarter= $hizbQuarter');

    var quranPage = QuranPage(
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
    quranPages.add(quranPage);
    // print('$head pageData= \n${convert.jsonEncode(quranPage)}');
  }
  return quranPages;
}

Map<String, int> hizbQuarterMap(int num) {
  var head = 'hizbQuarterMap() >>';

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
    case 50:
      quarterRes = 2;
      break;
    case 75:
      quarterRes = 3;
      break;
  }
  hizb = (quarter > 0) ? hizb + 1 : hizb;
/*
  print(
      '$head  \nquarterHizb= $quarterHizb \nhizb= $hizb, \nquarter= $quarter, '
      '\nquarterRes= $quarterRes, \nhizb= $hizb');
*/

  return <String, int>{'hizb': hizb, 'quarter': quarterRes};
}
