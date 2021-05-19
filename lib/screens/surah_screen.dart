import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/widgets/quran_text_view.dart';
import 'package:muslim_guide/widgets/surah/surah_header.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';

class SurahScreen extends StatelessWidget {
  Future<void> getData() async {
    //var x = await QuranRepo.getPages();
    //print('##SurahScreen## getData() data= $x');
    // MUST call it before access quranPages list in repo
    await QuranRepo.instance.getPages();
    //print('len= ${QuranRepo.instance.quranPages?.length}');

    final x = QuranRepo.instance.getQuranPage(1);
    // print('numberAyahMap for page1= ${x['ayahNumberMap']}');
  }

  // ignore: prefer_const_constructors
  @override
  Widget build(BuildContext context) {
    getData();
    final String pageAyahs = QuranRepo.instance.getQuranPage(1);
    final List<String> ayahList = QuranRepo.instance.getListOfAyahs(3);
    final Size screenSize = MediaQuery.of(context).size;
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: dimens.mediumPadding,
                      vertical: dimens.smallPadding,
                    ),
                    child: SurahNameTitle(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: dimens.mediumPadding,
                      vertical: dimens.smallPadding,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        // borderRadius: kSmallBorderRadius,
                        color: Theme.of(context).primaryColor,
                      ),
                      margin: EdgeInsets.only(bottom: 30),
                      padding: const EdgeInsets.all(dimens.smallPadding),
                      child: QuranTextView(quranAyahs: pageAyahs),
                    ),
                  ),
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
