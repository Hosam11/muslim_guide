import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_guide/args/quran_args.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart';
import 'package:muslim_guide/data/shared_prefs/perfs_keys.dart';
import 'package:muslim_guide/helpers/app_dialogs.dart';
import 'package:muslim_guide/helpers/arabic_numbers.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/routes.dart';
import 'package:muslim_guide/widgets/quran/custom_quran_textview.dart';
import 'package:muslim_guide/widgets/quran/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

String createHizbQuarter({@required int quarter, @required int hizb}) =>
    '$quarterLabel: ${convertToArabic(quarter)} - $hizbLabel: ${convertToArabic(hizb)}';

String createPageNumber(int pageNumber) =>
    '$pageLabel: ${convertToArabic(pageNumber)}';

String createJuzNumber(int juz) => '$juzLabel ${convertToArabic(juz)}';

List<Widget> quranPageContent(NewQuranPage quranPageModel) {
  final h = '@@ quran_helper @@ quranPageContent() >>';
  final pageWidgets = <Widget>[];

  if (quranPageModel.sajdaType == null) {
    for (final pageContent in quranPageModel.quranPageContents) {
      // mLog('$h pageContent= ${jsonEncode(pageContent)}');

      if (pageContent.ayah != null) {
        pageWidgets.add(QuranTextView(quranAyahs: pageContent.ayah));
      }
      if (pageContent.header != null) {
        pageWidgets.add(SurahNameTitle(surahName: pageContent.header));
      }
    }
  } else {
    switch (quranPageModel.sajdaType) {
      case SajdaType.normal:
        pageWidgets
            .add(CustomQuranTextView(customAyah: quranPageModel.ayahContent));
        break;
      case SajdaType.custom:
        final pageContent = quranPageModel.quranPageContents;
        for (var index = 0; index < pageContent.length; index++) {
          if (index == quranPageModel.sajdaIndex) {
            pageWidgets.add(
                CustomQuranTextView(customAyah: quranPageModel.ayahContent));
          } else {
            if (pageContent[index].ayah != null) {
              pageWidgets
                  .add(QuranTextView(quranAyahs: pageContent[index].ayah));
            }
            if (pageContent[index].header != null) {
              pageWidgets
                  .add(SurahNameTitle(surahName: pageContent[index].header));
            }
          }
        }
        break;
    }
  }
  return pageWidgets;
}

Future<void> onBookmarkPressed(
  int number,
  QuranProvider quranProvider,
  BuildContext context,
) async {
  final confirmDialogRes = await confirmationDialog(context);
  Fimber.i('confirmDialogRes= $confirmDialogRes');
  if (confirmDialogRes) {
    final isSaved = await setInt(value: number, key: pageNumberKey);
    Fimber.i('isSaved=  $isSaved');
    quranProvider.isBookmark = true;
  }
}

void onRestoreBookmarkPressed(BuildContext context) {
  final num = getInt(key: pageNumberKey, defaultValue: -1);
  if (num != -1) {
    Navigator.popAndPushNamed(
      context,
      quranPageControllerScreen,
      arguments: QuranArgs(num - 1),
    );
  }
}

Future<bool> quranPagePopScope(QuranProvider quranProvider) async {
  quranProvider.isShowDetails = false;
  return await Future.value(true);
}
