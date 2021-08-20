import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/helpers/app/arabic_numbers.dart';
import 'package:muslim_guide/z_prepare_app_files/model/old_quran_page/old_quran_page.dart';

const String _oldQuranPagesFile =
    'lib/z_prepare_app_files/archive_json/old_quran_pages.json';

const String _saveNewSinglePageContent =
    'lib/z_prepare_app_files/json_files/single_page.json';

enum _ContentType { surahHeader, ayah }

const _contentType = {
  _ContentType.surahHeader: 'header',
  _ContentType.ayah: 'ayah'
};

final _headers = <String?>[];

Future<void> main() async {
  // test getting single quran page
  final singlePageContent = await _singleQuranPageContent(596);
  var singlePageContentEncoded = jsonEncode(singlePageContent);
  await _writeToFile(singlePageContentEncoded, _saveNewSinglePageContent);
}

Future<void> _writeToFile(object, String fileName) async =>
    await File(fileName).writeAsString(object);

Future<List<OldQuranPage>> _getOldQuranPages() async {
  var h = '@@ estGetQuranPages @@ getQuranPages() >>';
  final quranPagesRes = await File(_oldQuranPagesFile).readAsString();

  final quranData = quranDataFromJson(quranPagesRes);
  // log('$h quranData= ${jsonEncode(quranData)}');

  return quranData;
}

Future<List<Map<String, String>>> _singleQuranPageContent(
  int quranPageIndex,
) async {
  final h = 'getSingleQuranPageContent() >> ';

  final quranPages = await _getOldQuranPages();
  final page = quranPages[quranPageIndex];

  return buildCompleteQuranPage(page);
}

List<Map<String, String>> buildCompleteQuranPage(OldQuranPage page) {
  final h = 'getFinalQuranPage() >> ';
  final pageContent = <Map<String, String>>[];

  print('$h');
  log('$h page= ${jsonEncode(page)}');
  final ayahLen = page.pageAyahs!.length;
  print('$h ayahLen= $ayahLen');
  final ayahBuffer = StringBuffer();

  for (var ayahIndex = 0; ayahIndex < ayahLen; ayahIndex++) {
    print('############### $h ayahIndex= [$ayahIndex] ###############');
    final ayah = page.pageAyahs![ayahIndex];
    print('$h ayah= ${jsonEncode(ayah)}');
    final firstSurahNumber = ayah.surahNumber;
    final nextSurahNumber = ayahIndex + 1 < ayahLen
        ? page.pageAyahs![ayahIndex + 1].surahNumber
        : page.pageAyahs![ayahIndex].surahNumber;

    // same surah
    if (firstSurahNumber == nextSurahNumber) {
      print('$h first==next');
      // create header
      _saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h f buffer= ${ayahBuffer.toString()}');
      // last iteration
      if (ayahIndex == ayahLen - 1) {
        print('$h last iteration');
        _addAyahToMap(pageContent, ayahBuffer.toString());
      }
    } else {
      print('$h else first==next');
      // add buffer to mapObj
      _saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h ayahBuffer= ${ayahBuffer.toString()}');
      _addAyahToMap(pageContent, ayahBuffer.toString());
      // clear buffer
      ayahBuffer.clear();
      print('$h buffer= ${ayahBuffer.toString()}');

      if (ayahIndex == ayahLen - 1) {
        print('$h last iteration');
        _addAyahToMap(pageContent, ayahBuffer.toString());
      }
    }
  }
  _printContentMap(pageContent);
  return pageContent;
}

void _addAyahToMap(
  List<Map<String?, String?>> pageContent,
  String ayah,
) {
  final h = 'addAyahToMap() >> ';
  var ayahMap = {_contentType[_ContentType.ayah]!: ayah};
  print('$h ayahMap= $ayahMap ');
  pageContent.add(ayahMap);
}

// save header of ayah and ayah itself
void _saveAyahInfo({
  required List<Map<String, String>> pageContent,
  required Ayah ayah,
  required StringBuffer ayahBuffer,
}) {
  _addHeaderToMap(pageContent, ayah);
  ayahBuffer.write(_createAyahText(ayah));
}

void _addHeaderToMap(
  List<Map<String, String>> pageContent,
  Ayah ayah,
) {
  final h = 'addHeaderToMap() >> ';
  if (!_headers.contains(ayah.surahName)) {
    var header = {_contentType[_ContentType.surahHeader]!: ayah.surahName!};
    print('$h header= $header');
    print('$h headers= ${_headers.join(',')}');
    pageContent.add(header);
    _headers.add(ayah.surahName);
  }

  // _printContentMap(pageContent);
}

String _createAyahText(Ayah ayah) {
  final h = 'addAyahToBuffer() >> ';

  var ayahNumber = convertToArabic(ayah.ayahNumber);

  if (ayah.ayahNumber! > 9) {
    ayahNumber = reversInt(ayahNumber);
  }
  print('ayahNumber= $ayahNumber');

  final ayahStr = '${ayah.ayahText} \uFD3F$ayahNumber\uFD3E ';
  print('$h ayahStr= $ayahStr');
  return ayahStr;
}

String reversInt(String s) => s.split('').reversed.join();

void _printContentMap(List<Map<String?, String?>> pageContent) {
  var h = 'printContentMap() >> ';
  print(
      '-------------------------- start $h ---------------------------------------');
  for (var x in pageContent) {
    print('x = $x');
  }
  print(
      '-------------------------- end $h ---------------------------------------');
}
