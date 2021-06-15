import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/helpers/arabic_numbers.dart';
import 'package:muslim_guide/not_use/model/quran_me.dart';
import 'package:muslim_guide/routes.dart' as routes;

class SurahItem extends StatelessWidget {
/*  final int surahNumber;
  final String name;
  final int numberOfAyahs;
  final String revelationType;*/

  // final ArabicNumbers _arabicNumbers = ArabicHelper.arabicNumber;

  final Surah surah;
  SurahItem({
/*    this.surahNumber,
    this.name,
    this.numberOfAyahs,
    this.revelationType, */
    this.surah,
  });

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return InkWell(
      onTap: () => onSurahPressed(context),
      child: Row(
        children: [
          // surah number
          Expanded(
            flex: isPortrait ? 3 : 2,
            child: Padding(
              padding: const EdgeInsets.all(smallPadding),
              child: Center(
                child: Text(convertToArabic(surah.number),
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
          ),
          // Surah Name
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(top: smallestPadding),
              child: Text(surah.name,
                  style: Theme.of(context).textTheme.headline6),
            ),
          ),
          // surah ayat & numberOfAyahs
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(smallPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(ayahs, style: Theme.of(context).textTheme.subtitle1),
                  Text(
                    surah.numberOfAyahs.toString(),
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          // surah revelation Type
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              surah.revelationType == RevelationType.meccan ? meccan : median,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }

  void onSurahPressed(BuildContext context) {
    /// handle data need for that screen
    /// 1- get page number
    Navigator.pushNamed(context, routes.quranPageController);
  }
}
