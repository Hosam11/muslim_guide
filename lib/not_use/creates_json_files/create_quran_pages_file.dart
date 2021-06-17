import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/not_use/model/old_quran_page/quran_page.dart';
import 'package:muslim_guide/not_use/model/returned_quran_pages.dart';

/// responsible for create json object and save it in file [quranPagesFile]

Future<void> main() async {
  await _storeData();
  // await _writeToFile(jsonEncode(_newQuranPages), 'quranPagesFile');
}

Future<Data> _getData(int page) async {
  final dataResponse = await get(
      Uri.parse('http://api.alquran.cloud/v1/page/$page/quran-uthmani'));

  final decodeData = jsonDecode(dataResponse.body) as Map<String, dynamic>;
  final pages = OriginalQuranPages.fromJson(decodeData);

  return pages.data;
}

/// get quran data form api convert it to object needed then return quranPages
/// list that can be saved in file
Future<List<OldQuranPage>> _storeData() async {
  var h = 'storeData() >>';

  var quranPages = <OldQuranPage>[];

  for (var i = 1; i <= 10; i++) {
    print('i= $i');

    var data = await _getData(i);
//    print('$head data= $data');
    var hizbQuarter = _hizbQuarterMap(data.ayahs.last.hizbQuarter);
    //   Fimber.i('hizbQuarter= $hizbQuarter');

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

    quranPages.add(quranPage);

    // quran page

    // print('$head pageData= \n${convert.jsonEncode(quranPage)}');
  }
  return quranPages;
}

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
    case 50:
      quarterRes = 2;
      break;
    case 75:
      quarterRes = 3;
      break;
  }
  hizb = (quarter > 0) ? hizb + 1 : hizb;

  return <String, int>{'hizb': hizb, 'quarter': quarterRes};
}

Future<void> _writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);
