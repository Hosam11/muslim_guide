import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/helpers/quran_helper.dart';
import 'package:muslim_guide/widgets/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_header.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

class QuranPageScreen extends StatelessWidget {
  const QuranPageScreen({Key key, this.ayah, this.quranPageModel})
      : super(key: key);
  final Ayah ayah;
  // List<Map<String, String>> pageContent;
  final NewQuranPage quranPageModel;
  @override
  Widget build(BuildContext context) {
    /* final pageAyahsStr = QuranRepo.instance.getQuranPage(3);
    final ayahList = QuranRepo.instance.getListOfAyahs(3);
    final screenSize = MediaQuery.of(context).size;
*/
    Fimber.i('-ayah= $ayah');

    /*   final ayah2 =
        '۞ وَإِن كُنتُمْ عَلَىٰ سَفَرٍۢ وَلَمْ تَجِدُوا۟ كَاتِبًۭا فَرِهَٰنٌۭ مَّقْبُوضَةٌۭ ۖ فَإِنْ أَمِنَ بَعْضُكُم بَعْضًۭا فَلْيُؤَدِّ ٱلَّذِى ٱؤْتُمِنَ أَمَٰنَتَهُۥ وَلْيَتَّقِ ٱللَّهَ رَبَّهُۥ ۗ وَلَا تَكْتُمُوا۟ ٱلشَّهَٰدَةَ ۚ وَمَن ';
    final ayah3 =
        'لِّلَّهِ مَا فِى ٱلسَّمَٰوَٰتِ وَمَا فِى ٱلْأَرْضِ ۗ وَإِن تُبْدُوا۟ مَا فِىٓ أَنفُسِكُمْ أَوْ تُخْفُوهُ يُحَاسِبْكُم بِهِ ٱللَّهُ ۖ فَيَغْفِرُ لِمَن يَشَآءُ';
    final ayahList = [ayah, ayah2, ayah3];
   */
    return Scaffold(
      backgroundColor: colors.kSecondaryColor,
      body: SafeArea(
        // parent of whole screen
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SurahHeader(
                      juzName: quranPageModel.juz,
                      surahName: quranPageModel.surahName),
                  SurahNameTitle(),
                  // QuranTextView(quranAyahs: ayah, key: UniqueKey()),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SurahHeader(
                // todo: change this to be left or juzName label
                surahName: createPageNumber(quranPageModel.pageNumber),
                juzName: createHizbQuarter(
                  quarter: quranPageModel.quarter,
                  hizb: quranPageModel.hizb,
                ),
                // juzName: 'الحزب ${quranPageModel.quarter} - الربع 3',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
