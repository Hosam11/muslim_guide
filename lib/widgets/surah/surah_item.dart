import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/args/quran_args.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/helpers/app/arabic_numbers.dart';
import 'package:muslim_guide/routes.dart' as routes;

class SurahItem extends StatelessWidget {
  final Surah? surah;

  SurahItem({
    this.surah,
  });

  @override
  Widget build(BuildContext context) {
    // final updatedQuranProvider = Provider.of<QuranProvider>(context);

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Material(
      color: kPrimaryColor,
      child: InkWell(
        onTap: () => onSurahPressed(context),
        child: Row(
          children: [
            // surah number
            Expanded(
              flex: isPortrait ? 3 : 2,
              child: Padding(
                padding: const EdgeInsets.all(smallDimens),
                child: Center(
                  child: Text(convertToArabic(surah!.number),
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ),
            // Surah Name
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(top: smallestDimens),
                child: Text(surah!.name!,
                    style: Theme.of(context).textTheme.headline6),
              ),
            ),
            // surah ayat & numberOfAyahs
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(smallDimens),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(ayahs, style: Theme.of(context).textTheme.subtitle1),
                    Text(
                      convertToArabic(surah!.numberOfAyahs),
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
                surah!.revelationType == RevelationType.meccan
                    ? meccan
                    : median,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSurahPressed(BuildContext context) {
    /// handle data need for that screen
    /// 1- get page number
    Navigator.pushNamed(
      context,
      routes.quranPageControllerScreen,
      arguments: QuranArgs(
        surah!.surahPageNumber! - 1,
      ),
    );
    // final quranProvider = Provider.of<QuranProvider>(context, listen: false);
    // quranProvider.quranPageNumber = surah.surahPageNumber - 1;
    Fimber.i('surahPageNumber=  ${surah!.surahPageNumber! - 1}');
  }
}
