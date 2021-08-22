import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';

class QuranTextView extends StatelessWidget {
  final String? quranAyahs;
  final bool ayahWithStyle;
  final bool isStartSurah;

  const QuranTextView({
    Key? key,
    this.quranAyahs,
    this.ayahWithStyle = true,
    this.isStartSurah = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Fimber.i('isStartSurah = $isStartSurah');
    return ayahWithStyle
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: smallDimens),
            child: Container(
              // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              // margin: EdgeInsets.only(bottom: 8),
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.all(smallDimens),
              child:
                  _AyahText(quranAyahs: quranAyahs, isStartSurah: isStartSurah),
            ),
          )
        : _AyahText(quranAyahs: quranAyahs, isStartSurah: isStartSurah);
  }
}

class _AyahText extends StatelessWidget {
  const _AyahText({
    Key? key,
    required this.quranAyahs,
    this.isStartSurah = false,
  }) : super(key: key);

  final String? quranAyahs;
  final bool isStartSurah;

  @override
  Widget build(BuildContext context) {
    Fimber.i('isStartSurah= $isStartSurah');
    return Column(
      children: [
        isStartSurah
            ? Text(basmallah, style: ayahTextStyle(context))
            : const SizedBox(),
        Text(
          '\u202E$quranAyahs',
          style: ayahTextStyle(context),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
