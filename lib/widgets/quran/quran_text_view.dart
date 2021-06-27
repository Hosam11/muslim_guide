import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/fonts.dart' as fonts;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/styles.dart';

class QuranTextView extends StatelessWidget {
  final String quranAyahs;
  final bool ayahWithStyle;

  const QuranTextView({
    Key key,
    this.quranAyahs,
    this.ayahWithStyle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ayahWithStyle
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: dimens.smallPadding),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              // margin: EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(dimens.smallPadding),
              child: _AyahText(quranAyahs: quranAyahs),
            ),
          )
        : _AyahText(quranAyahs: quranAyahs);
  }
}

class _AyahText extends StatelessWidget {
  const _AyahText({
    Key key,
    @required this.quranAyahs,
  }) : super(key: key);

  final String quranAyahs;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\u202E$quranAyahs',
      // '$quranAyahs',
      style: ayahTextStyle(context),
      // softWrap: true,
      textAlign: TextAlign.justify,
    );
  }
}
