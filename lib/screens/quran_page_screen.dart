import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/widgets/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_header.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

class QuranPageScreen extends StatelessWidget {
  const QuranPageScreen({Key key, this.ayah}) : super(key: key);
  final String ayah;

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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const SurahHeader(
                      juzName: 'الجزء الاول', surahName: 'الفاتحة'),
                  SurahNameTitle(),
                  QuranTextView(quranAyahs: ayah, key: UniqueKey()),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: const SurahHeader(
                surahName: 'الصفحة 106',
                juzName: 'الحزب 13 - الربع 3',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
