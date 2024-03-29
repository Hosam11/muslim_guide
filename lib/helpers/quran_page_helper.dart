import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_guide/args/quran_args.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page_content.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart';
import 'package:muslim_guide/data/shared_prefs/perfs_keys.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/arabic_numbers.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/routes.dart';
import 'package:muslim_guide/widgets/quran/custom_quran_textview.dart';
import 'package:muslim_guide/widgets/quran/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

class QuranPageHelper {
  QuranPageHelper._privateConstructor();

  static final QuranPageHelper instance = QuranPageHelper._privateConstructor();

  String createHizbQuarter({required int? quarter, required int? hizb}) =>
      '$quarterLabel: ${convertToArabic(quarter)} - $hizbLabel: ${convertToArabic(hizb)}';

  String createPageNumber(int? pageNumber) =>
      '$pageLabel: ${convertToArabic(pageNumber)}';

  String createJuzNumber(int? juz) => '$juzLabel ${convertToArabic(juz)}';

  List<Widget> quranPageContent(QuranPage quranPageModel) {
    // final h = '@@ quran_helper @@ quranPageContent() >>';
    final pageWidgets = <Widget>[];

    switch (quranPageModel.sajdaType) {
      case SajdaType.normal:
        pageWidgets
            .add(CustomQuranTextView(customAyah: quranPageModel.ayahContent));
        break;
      case SajdaType.custom:
        final quranPageContents = quranPageModel.quranPageContents!;
        for (var index = 0; index < quranPageContents.length; index++) {
          final pageContent = quranPageContents[index];

          if (pageContent.header != null) {
            pageWidgets.add(SurahNameTitle(surahName: pageContent.header));
            index++;
            _addingQuranPage(
                index, quranPageModel, pageWidgets, quranPageContents, true);
          } else {
            _addingQuranPage(
                index, quranPageModel, pageWidgets, quranPageContents);
          }
        }
        break;
      // normal page without sajda
      case null:
        final quranPageContents = quranPageModel.quranPageContents!;
        for (var index = 0; index < quranPageContents.length; ++index) {
          final pageContent = quranPageContents[index];

          /// mean there is surah header, and for every surah header must there
          /// be [basmallah] in next [QuranTextView]
          if (pageContent.header != null) {
            // add header
            pageWidgets.add(SurahNameTitle(surahName: pageContent.header));
            // increment index to get next quren text view and skip it then
            // save it in our array
            index++;
            var nextQuranPageContent = quranPageContents[index];
            pageWidgets.add(
              QuranTextView(
                quranAyahs: nextQuranPageContent.ayah,
                isStartSurah: quranPageModel.pageNumber != 1 ? true : false,
              ),
            );
          } else {
            pageWidgets.add(QuranTextView(quranAyahs: pageContent.ayah));
          }
        }
        break;
    }

    Fimber.i('pageWidgets= $pageWidgets');
    return pageWidgets;
  }

  void _addingQuranPage(int index, QuranPage quranPageModel,
      List<Widget> pageWidgets, List<QuranPageContent> quranPageContents,
      [bool isStartSurah = false]) {
    if (index == quranPageModel.sajdaIndex) {
      pageWidgets.add(
        CustomQuranTextView(
          customAyah: quranPageModel.ayahContent,
          isStartSurah: isStartSurah,
        ),
      );
    } else {
      pageWidgets.add(QuranTextView(
        quranAyahs: quranPageContents[index].ayah,
        isStartSurah: isStartSurah,
      ));
    }
  }

  Future<void> onBookmarkPressed(
    int? number,
    QuranProvider quranProvider,
    BuildContext context,
  ) async {
    final confirmDialogRes = await takeActionDialog(
      context: context,
      msg: confirmBookmark,
    );
    Fimber.i('confirmDialogRes= $confirmDialogRes');
    if (confirmDialogRes != null && confirmDialogRes) {
      final isSaved = await setInt(value: number!, key: pageNumberKey);
      quranProvider.markedPageNum = number;
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
}
