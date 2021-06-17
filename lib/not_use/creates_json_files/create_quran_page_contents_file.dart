import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/helpers/arabic_numbers.dart';
import 'package:muslim_guide/not_use/model/old_quran_page/quran_page.dart';
import 'package:muslim_guide/not_use/network.dart';

/// responsible for create json object andsave it in file [quranPagesContentFile]
Future<void> main() async {
  final pageContent = await singleQuranPageContent(206);
  var x = jsonEncode(pageContent);
  print('x= $x');
  await getQuranContent();
  // quran_page_content.json
  // printSampleQuranContent(3, 6);
  final pages = jsonEncode(_quranContent.sublist(600));
  print('pages= $pages');

  await writeToFile(jsonEncode(_quranContent), quranPagesContentFile);
}

Future<List<OldQuranPage>> testGetQuranPages() async {
  var h = '@@ estGetQuranPages @@ getQuranPages() >>';
  final quranPagesRes = await File(quranPagesFile).readAsString();

  final quranData = quranDataFromJson(quranPagesRes);
  // log('$h quranData= ${jsonEncode(quranData)}');

  return quranData;
}

final headers = <String>[];

final _quranContent = <List<Map<String, String>>>[];

Future<void> getQuranContent() async {
  final quranPages = await testGetQuranPages();
  for (var pageIndex = 0; pageIndex < quranPages.length; pageIndex++) {
    final quranPageContent = await getQuranPageContent(quranPages[pageIndex]);
    _quranContent.add(quranPageContent);
  }
}

Future<List<Map<String, String>>> getQuranPageContent(OldQuranPage page) async {
  final h = 'getQuranPageContent() >> ';
  final pageContent = <Map<String, String>>[];

  print('$h');
  log('$h page= ${jsonEncode(page)}');
  final ayahLen = page.pageAyahs.length;
  print('$h ayahLen= $ayahLen');
  final ayahBuffer = StringBuffer();

  for (var ayahIndex = 0; ayahIndex < ayahLen; ayahIndex++) {
    print('############### $h ayahIndex= [$ayahIndex] ###############');
    final ayah = page.pageAyahs[ayahIndex];
    print('$h ayah= ${jsonEncode(ayah)}');
    final firstSurahNumber = ayah.surahNumber;
    final nextSurahNumber = ayahIndex + 1 < ayahLen
        ? page.pageAyahs[ayahIndex + 1].surahNumber
        : page.pageAyahs[ayahIndex].surahNumber;

    // same surah
    if (firstSurahNumber == nextSurahNumber) {
      print('$h first==next');
      // create header
      saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h f buffer= ${ayahBuffer.toString()}');
      // last iteration
      if (ayahIndex == ayahLen - 1) {
        print('$h last iteration');
        addAyahToMap(pageContent, ayahBuffer.toString());
      }
    } else {
      print('$h else first==next');
      // add buffer to mapObj
      saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h ayahBuffer= ${ayahBuffer.toString()}');
      addAyahToMap(pageContent, ayahBuffer.toString());
      // clear buffer
      ayahBuffer.clear();
      // create new header
      saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h buffer= ${ayahBuffer.toString()}');

      if (ayahIndex == ayahLen - 1) {
        print('$h last iteration');
        addAyahToMap(pageContent, ayahBuffer.toString());
      }
    }
  }
  printContentMap(pageContent);
  return pageContent;
}

Future<List<Map<String, String>>> singleQuranPageContent(
    int quranPageIndex) async {
  final h = 'getSingleQuranPageContent() >> ';

  final quranPages = await testGetQuranPages();
  final pageContent = <Map<String, String>>[];

  final page = quranPages[quranPageIndex];

  print('$h');
  log('$h page= ${jsonEncode(page)}');
  final ayahLen = page.pageAyahs.length;
  print('$h ayahLen= $ayahLen');
  final ayahBuffer = StringBuffer();

  for (var ayahIndex = 0; ayahIndex < ayahLen; ayahIndex++) {
    print('############### $h ayahIndex= [$ayahIndex] ###############');
    final ayah = page.pageAyahs[ayahIndex];
    print('$h ayah= ${jsonEncode(ayah)}');
    final firstSurahNumber = ayah.surahNumber;
    final nextSurahNumber = ayahIndex + 1 < ayahLen
        ? page.pageAyahs[ayahIndex + 1].surahNumber
        : page.pageAyahs[ayahIndex].surahNumber;

    // same surah
    if (firstSurahNumber == nextSurahNumber) {
      print('$h first==next');
      // create header
      saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h f buffer= ${ayahBuffer.toString()}');
      // last iteration
      if (ayahIndex == ayahLen - 1) {
        print('$h last iteration');
        addAyahToMap(pageContent, ayahBuffer.toString());
      }
    } else {
      print('$h else first==next');
      // add buffer to mapObj
      saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h ayahBuffer= ${ayahBuffer.toString()}');
      addAyahToMap(pageContent, ayahBuffer.toString());
      // clear buffer
      ayahBuffer.clear();
      // create new header
      saveAyahInfo(
        pageContent: pageContent,
        ayah: ayah,
        ayahBuffer: ayahBuffer,
      );
      print('$h buffer= ${ayahBuffer.toString()}');

      if (ayahIndex == ayahLen - 1) {
        print('$h last iteration');
        addAyahToMap(pageContent, ayahBuffer.toString());
      }
    }
  }
  printContentMap(pageContent);
  return pageContent;
}

// save header of ayah and ayah itself
void saveAyahInfo({
  List<Map<String, String>> pageContent,
  Ayah ayah,
  StringBuffer ayahBuffer,
}) {
  addHeaderToMap(pageContent, ayah);
  ayahBuffer.write(createAyahText(ayah));
}

enum ContentType { surahHeader, ayah }

String createAyahText(Ayah ayah) {
  final h = 'addAyahToBuffer() >> ';

  final ayahStr =
      '${ayah.ayahText} \uFD3F${convertToArabic(ayah.ayahNumber)}\uFD3E ';
  print('$h ayahStr= $ayahStr');
  return ayahStr;
}

void addAyahToMap(
  List<Map<String, String>> pageContent,
  String ayah,
) {
  final h = 'addAyahToMap() >> ';
  var ayahMap = {contentType[ContentType.ayah]: ayah};
  print('$h ayahMap= $ayahMap ');
  pageContent.add(ayahMap);
}

void addHeaderToMap(
  List<Map<String, String>> pageContent,
  Ayah ayah,
) {
  final h = 'addHeaderToMap() >> ';
  if (!headers.contains(ayah.surahName)) {
    var header = {contentType[ContentType.surahHeader]: ayah.surahName};
    print('$h header= $header');
    print('$h headers= ${headers.join(',')}');
    pageContent.add(header);
    headers.add(ayah.surahName);
  }

  printContentMap(pageContent);
}

void printContentMap(List<Map<String, String>> pageContent) {
  var h = 'printContentMap() >> ';
  print(
      '-------------------------- start $h ---------------------------------------');
  for (var x in pageContent) {
    print('x = $x');
  }
  print(
      '-------------------------- end $h ---------------------------------------');
}

const contentType = {
  ContentType.surahHeader: 'header',
  ContentType.ayah: 'ayah'
};

void printSampleQuranContent(int start, int end) {
  final h = 'printSampleQuranContent() >> ';
  print('$h start= $start, end= $end');
  for (var index = start; index < end; index++) {
    print('>>>>>>>>>>>>>>>>>>> i=[$index] <<<<<<<<<<<<<<<<<<<<<<<<<');
    printContentMap(_quranContent[index]);
  }
}
