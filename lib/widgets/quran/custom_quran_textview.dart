import 'package:flutter/material.dart';
// <<<<<<< Updated upstream
import 'package:muslim_guide/constants/constants_imports.dart';
// =======
// import 'package:muslim_guide/constants/app_colors.dart';
// >>>>>>> Stashed changes
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';

const ayah = '';
const sajdaWord = '';
const remainAyah = '';

class CustomQuranTextView extends StatelessWidget {
  const CustomQuranTextView({
    Key? key,
    required this.customAyah,
    this.isStartSurah = false,
  }) : super(key: key);
  final AyahContent? customAyah;
  final bool isStartSurah;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: smallDimens),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        padding: const EdgeInsets.all(smallDimens),
// <<<<<<< Updated upstream
        child: Column(
          children: [
            isStartSurah
                ? Text(basmallah, style: ayahTextStyle(context))
                : const SizedBox(),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: ayahTextStyle(context),
                // softWrap: true,
                children: [
                  // TextSpan(text: '\u202E$ayah '), // test case
                  TextSpan(
                      text: ' \u202E${customAyah!.firstAyahs} '), // real case
                  TextSpan(
                    // text: '\u202E$sajdaWord', // test case
                    text: ' \u202E${customAyah!.sajdaWords} ', // real case
                    style: const TextStyle(
                      textBaseline: TextBaseline.ideographic,
                      decoration: TextDecoration.underline,
                      shadows: [
                        Shadow(color: Colors.white, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decorationColor: Colors.white,
                    ),
                  ),
                  // TextSpan(text: ' \u202E $remainAyah '), // test case
                  TextSpan(
                      text: ' \u202E ${customAyah!.lastAyahs} '), // real case
                ],
/*=======
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            style: ayahTextStyle(context),
            // softWrap: true,
            children: [
              // TextSpan(text: '\u202E$ayah '), // real case
              TextSpan(text: ' \u202E${customAyah!.firstAyahs} '), // test case
              TextSpan(
                // text: '\u202E$sajdaWord', // real case
                text: ' \u202E${customAyah!.sajdaWords} ', // test case
                style: const TextStyle(
                  textBaseline: TextBaseline.ideographic,
                  decoration: TextDecoration.underline,
                  shadows: [Shadow(color: kTextColor, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decorationColor: kTextColor,
                ),
>>>>>>> Stashed changes*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
