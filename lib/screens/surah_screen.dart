import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/fonts.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/widgets/quran_page/surh_header.dart';

import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';

/*
'\uFD3F1\uFD3E \n'
          ' ${Util.arabicNumber.convert(155)}  \n'
          '\u06DD1',
          style: TextStyle(fontSize: 50.0),
 */

const headerTextStyle = TextStyle(
  fontSize: 25.0,
);

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
    final String pageAyahs = QuranRepo.instance.getQuranPage(3);
    final List<String> ayahList = QuranRepo.instance.getListOfAyahs(3);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        // parent of whole screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const PageHeader(),
            Center(
              child: Container(
                color: const Color(0xFFCEEFF9),
                margin: const EdgeInsets.all(smallestPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      '\uFD3F',
                      style: headerTextStyle,
                    ),
                    Text(
                      'الفاتحة2 ',
                      style: headerTextStyle.copyWith(
                        color: kSecondaryColor,
                      ),
                    ),
                    const Text(
                      '\uFD3E',
                      style: headerTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    SizedBox(
                      width: screenSize.width - 10,
                      child: AutoSizeText(
                        '\u202E$pageAyahs',
                        // pageAyahs,
                        presetFontSizes: [25, 34],
                        style: const TextStyle(
                          letterSpacing: 0.0,
                          fontFamily: tajawalReg,
                          wordSpacing: 1.0,
                        ),
                        softWrap: true,
                        // pageAyahs,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    /*  ...ayahList
                        .map(
                          (String ayah) => Text(
                            // '\u202E$ayah',
                            ayah,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        )
                        .toList(),*/
                    /*Text(
                      '\u202E' + pageAyahs,
                      // pageAyahs,
                      textAlign: TextAlign.justify,
                      */ /*   minFontSize: ,
                            maxFontSize: ,*/ /*
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateAutoscaleFontSize(
    String text,
    TextStyle style,
    double startFontSize,
    double maxWidth,
  ) {
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    var currentFontSize = startFontSize;

    for (var i = 0; i < 100; i++) {
      // limit max iterations to 100
      final nextFontSize = currentFontSize + 1;
      final nextTextStyle = style.copyWith(fontSize: nextFontSize);
      textPainter.text = TextSpan(text: text, style: nextTextStyle);
      textPainter.layout();
      if (textPainter.width >= maxWidth) {
        break;
      } else {
        currentFontSize = nextFontSize;
        // continue iteration
      }
    }

    return currentFontSize;
  }
}
