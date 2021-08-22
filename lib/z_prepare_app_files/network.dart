/*
// FIXME: m

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/z_prepare_app_files/model/old_quran_page/old_quran_page.dart';
import 'package:muslim_guide/z_prepare_app_files/model/quran_me.dart';
import 'package:muslim_guide/z_prepare_app_files/model/returned_quran_pages.dart';

Future<void> main() async {
var finalObj = await surahWithPageNumber();
  print({'finalObj.length= ${finalObj.length}'});
  var surahPageNumber = List<Map<int, int>>.from(finalObj);
  print('surahPageNumber= $surahPageNumber');
  var surahsReferenceList = await _getMetaData();
  print('metaListLen= ${surahsReferenceList?.length}');
  final finalSurahList = await setupSurahsWithPageNumber(surahPageNumber);
  print('first= ${jsonEncode(finalSurahList.first)}, '
      'last= ${jsonEncode(finalSurahList.last)}');


}

const String oldQuranPagesFile =
    'lib/z_not_use/archive_json/old_quran_pages.json';

Future<List<Surah>> setupSurahsWithPageNumber(
  List<Map<int, int>> surahPageNumber,
) async {
  final surahListStr = await File(surahsListFile).readAsString();
  // FIXME: m

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
Future<List<OldQuranPage>> setupFinalQuranPageFile(
  List<Map<int, int>> surahPageNumber,
) async {
  var quranPagesList = await getNewQuranPages();

  final newList = <OldQuranPage>[];
  for (var i = 0; i < surahPageNumber.length; i++) {
    var quranPage = quranPagesList[i];

    var pageNumberObj = surahPageNumber[i];
    print('pageNumberObj= $pageNumberObj');
    print('i= $i');
    // err
    var pageNumber = pageNumberObj[i + 1];
    print('pageNumber= $pageNumber');
    quranPage.pageNumber = pageNumber;
    // newList.add(OldQuranPage.clone(quranPage));
  }
  return quranPagesList;
}

Future<Set<Map<int, int>>> surahWithPageNumber() async {
  var quranPagesList = await getNewQuranPages();
  var pageNumberWithSurahNumber = <Map<int, int>>{};

  for (var page in quranPagesList) {
    for (var ayah in page.pageAyahs!) {
      addToSet(pageNumberWithSurahNumber, ayah, page.pageNumber);
    }
  }

  return pageNumberWithSurahNumber;
}

Future<List<OldQuranPage>> getNewQuranPages() async {
  final quranPagesRes = await File(oldQuranPagesFile).readAsString();
  // FIXME: m
  final quranData = []
quranDataFromJson(quranPagesRes)
;
  // mLog('$h quranData= ${convert.jsonEncode(quranData)}');
  print('quranDataLen= ${quranData.length}');
  return quranData as FutureOr<List<OldQuranPage>>;
}

void addToSet(Set<Map<int?, int?>> set, Ayah ayah, int? pageNumber) {
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

  await File('old_quran_pages.json').writeAsString(quranPagesStr);
}

Future<void> writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);

Future<Data?> _getData(int page) async {
  final dataResponse = await get(
      Uri.parse('http://api.alquran.cloud/v1/page/$page/quran-uthmani'));

  final decodeData = jsonDecode(dataResponse.body) as Map<String, dynamic>;
  final pages = OriginalQuranPages.fromJson(decodeData);

  return pages.data;
}

var metaLink = 'http://api.alquran.cloud/v1/meta';

Future<List<SurahsReference>?> _getMetaData() async {
  print('getMetaData');
  var metaLink = 'http://api.alquran.cloud/v1/meta';

  final dataResponse = await get(Uri.parse(metaLink));

  final decodeData = dataResponse.body;

  final metaModel = metaListFromJson(decodeData);

  var surahResList = metaModel.data!.surahs!.references;
 // create our target object for surahList form meta endpoint
  var targetSurahList = <Surah>[];
    for (var surRef in surahResList) {
      var surah = Surah(
        name: surRef.name,
        number: surRef.number,
        numberOfAyahs: surRef.numberOfAyahs,
        revelationType: surRef.revelationType,
      );
      targetSurahList.add(surah);
    }

  // await writeToFile(jsonEncode(targetSurahList), 'surahList.json');
  return surahResList;
}
*/
