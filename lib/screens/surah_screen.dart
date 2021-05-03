import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/repository/quran_repo.dart';
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

  @override
  Widget build(BuildContext context) {
    getData();
    String pageAyahs = QuranRepo.instance.getQuranPage(1);
    return Scaffold(
      body: SafeArea(
        // parent of whole screen
        child: Container(
          decoration: kBackgroundBoxDecoration,
          child: SingleChildScrollView(
            child: Container(
              // decoration: kBackgroundBoxDecoration,
              child: Column(
                children: [
                  // juz and suruh name
                  Container(
                    color: kPrimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'الجزء الاول',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'الفاتحة',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // header of page
                  Container(
                    color: const Color(0xFFCEEFF9),
                    margin: const EdgeInsets.all(smallestPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\uFD3F',
                          style: headerTextStyle,
                        ),
                        Text(
                          'الفاتحة',
                          style:
                              headerTextStyle.copyWith(color: kSecondaryColor),
                        ),
                        Text(
                          '\uFD3E',
                          style: headerTextStyle,
                        ),
                      ],
                    ),
                  ),
                  // body of page
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('بسم الله الرحمن الرحيم'),
                        SelectableText(
                          pageAyahs,
                          enableInteractiveSelection: true,
                          cursorColor: kPrimaryColor,
                          toolbarOptions: const ToolbarOptions(
                            copy: true,
                            selectAll: true,
                          ),
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 25.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
