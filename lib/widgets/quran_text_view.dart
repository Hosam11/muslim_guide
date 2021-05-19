import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/fonts.dart' as fonts;

class QuranTextView extends StatelessWidget {
  final String quranAyahs;

  const QuranTextView({Key key, this.quranAyahs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '\u202E$quranAyahs',
      style: Theme.of(context).textTheme.headline5.copyWith(
            fontFamily: fonts.meQuranFont,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
          ),
      // softWrap: true,
      textAlign: TextAlign.justify,
    );
  }
}
