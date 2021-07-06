import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';

const ayah = '';
const sajdaWord = '';
const remainAyah = '';

class CustomQuranTextView extends StatelessWidget {
  const CustomQuranTextView({Key key, @required this.customAyah})
      : super(key: key);
  final AyahContent customAyah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallPadding),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        padding: const EdgeInsets.all(smallPadding),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: ayahTextStyle(context),
            // softWrap: true,
            children: [
              // TextSpan(text: '\u202E$ayah '), // real case
              TextSpan(text: ' \u202E${customAyah.firstAyahs} '), // test case
              TextSpan(
                // text: '\u202E$sajdaWord', // real case
                text: ' \u202E${customAyah.sajdaWords} ', // test case
                style: TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  decoration: TextDecoration.underline,
                  shadows: [Shadow(color: Colors.white, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decorationColor: Colors.white,
                ),
              ),
              // TextSpan(text: ' \u202E $remainAyah '), // real case
              TextSpan(text: ' \u202E ${customAyah.lastAyahs} '), // test case
            ],
          ),
        ),
      ),
    );
  }
}
