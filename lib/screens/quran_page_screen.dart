import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/constants/fonts.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/helpers/quran_helper.dart';
import 'package:muslim_guide/widgets/quran/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_header.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

class QuranPageScreen extends StatelessWidget {
  const QuranPageScreen({Key key, this.quranPageModel}) : super(key: key);

  // List<Map<String, String>> pageContent;
  final NewQuranPage quranPageModel;

  /*
   SurahHeader(
    juzName: createJuzNumber(quranPageModel.juz),
    surahName: quranPageModel.surahName,
  ),
   */
  @override
  Widget build(BuildContext context) {
    final h = '@@ $runtimeType @@ build() >> ';
    mLog(
        '$h quranPageContents= \n${jsonEncode(quranPageModel.quranPageContents)} ');
    var str = 'يَ͟͟سْ͟͟جُ͟͟دُ͟͟و͟نَ͟͟ ͟';
    return Scaffold(
      backgroundColor: colors.kSecondaryColor,
      body: SafeArea(
        // parent of whole screen
        child: Column(
          children: [
            SurahHeader(
              juzName: createJuzNumber(quranPageModel.juz),
              surahName: quranPageModel.surahName,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      ...quranPageContent(quranPageModel.quranPageContents)
                    ],
                  ),
                ),
              ),
            ),
            SurahHeader(
              // todo: change this to be left or juzName label
              surahName: createPageNumber(quranPageModel.pageNumber),
              juzName: createHizbQuarter(
                quarter: quranPageModel.quarter,
                hizb: quranPageModel.hizb,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
