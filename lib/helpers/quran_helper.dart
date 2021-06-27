import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/models/new_quran_pages/quran_page_content.dart';
import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/helpers/arabic_numbers.dart';
import 'package:muslim_guide/widgets/quran/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';
import '';

// enum QuranContentType { surahHeader, ayah }

/*class QuranHelper {
  QuranHelper._();

  static final QuranHelper instance = QuranHelper._();
  final QuranRepo _quranRepo = QuranRepo.instance;
}*/

String createHizbQuarter({@required int quarter, @required int hizb}) =>
    '$quarterLabel: $quarter - $hizbLabel: $hizb';

String createPageNumber(int pageNumber) => '$pageLabel: $pageNumber';

String createJuzNumber(int juz) => '$juzLabel $juz';

List<Widget> quranPageContent(List<QuranPageContent> quranPageContents) {
  final h = '@@ quranPageContent() @@ >>';
  final pageWidgets = <Widget>[];

  for (final pageContent in quranPageContents) {
    mLog('$h pageContent= ${jsonEncode(pageContent)}');
    if (pageContent.ayah != null) {
      pageWidgets
          .add(QuranTextView(quranAyahs: pageContent.ayah, key: UniqueKey()));
    }
    if (pageContent.header != null) {
      pageWidgets.add(SurahNameTitle(name: pageContent.header));
    }
  }
  return pageWidgets;
}
