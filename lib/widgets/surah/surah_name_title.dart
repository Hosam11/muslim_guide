import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/data/app_data/surah_titles_data.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/helpers/app/arabic_numbers.dart';
import 'package:muslim_guide/widgets/surah/surah_name_info.dart';

class SurahNameTitle extends StatefulWidget {
  const SurahNameTitle({
    Key? key,
    required this.surahName,
  }) : super(key: key);
  final String? surahName;

  @override
  _SurahNameTitleState createState() => _SurahNameTitleState();
}

class _SurahNameTitleState extends State<SurahNameTitle> {
  late Surah curSurah;
  @override
  void initState() {
    super.initState();
    curSurah = surahHeaders.firstWhere((e) => e.name == widget.surahName);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallDimens),
      child: Container(
        // decoration: styles.kPrimaryBackgroundBoxDecoration.copyWith(
        decoration: BoxDecoration(
          // borderRadius: styles.kSmallBorderRadius,
          color: kPrimaryColor,
          boxShadow: [shadowFromColor(kPrimaryColor)],
        ),
        padding: const EdgeInsets.all(smallDimens + 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SurahNameInfo(
              title: rank,
              number: convertToArabic(curSurah.number),
            ),
            Center(
              child: Text(
                widget.surahName!,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SurahNameInfo(
              title: ayahs,
              number: convertToArabic(curSurah.numberOfAyahs),
            ),
          ],
        ),
      ),
    );
  }
}
