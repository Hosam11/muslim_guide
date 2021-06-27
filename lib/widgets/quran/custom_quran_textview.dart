import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/custom_ayah/custom_ayah.dart';

const ayah = '';
const sajdaWord = '';
const remainAyah = '';

class CustomQuranTextView extends StatelessWidget {
  const CustomQuranTextView({Key key, @required this.customAyah})
      : super(key: key);
  final CustomAyah customAyah;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
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
                  TextSpan(text: '\u202E$ayah '),
                  // TextSpan(text: ' \u202E${customAyah.ayahContent.firstAyahs} '),
                  TextSpan(
                    text: '\u202E$sajdaWord',
                    // text: ' \u202E${customAyah.ayahContent.sajdaWords} ',
                    style: TextStyle(
                      textBaseline: TextBaseline.ideographic,
                      decoration: TextDecoration.underline,
                      shadows: [
                        Shadow(color: Colors.white, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decorationColor: Colors.white,
                    ),
                  ),
                  TextSpan(text: ' \u202E $remainAyah '),
                  // TextSpan(text: ' \u202E ${customAyah.ayahContent.lastAyahs} '),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
