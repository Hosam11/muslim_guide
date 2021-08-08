import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/helpers/quran_page_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/widgets/quran/quran_footer.dart';
import 'package:muslim_guide/widgets/quran/quran_header.dart';
import 'package:provider/provider.dart';

class QuranPageScreen extends StatelessWidget {
  QuranPageScreen(this.quranPageModel, [Key key]) : super(key: key);

  final NewQuranPage quranPageModel;

  @override
  Widget build(BuildContext context) {
    final h = '@@ $runtimeType @@ build() >> ';
    // mLog('$h quranPageContents= \n${jsonEncode(quranPageModel)} ');

    final quranProvider = Provider.of<QuranProvider>(context);

    return WillPopScope(
      onWillPop: () async => await quranPagePopScope(quranProvider),
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              // page content
              Column(
                children: [
                  Expanded(
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      enableFeedback: false,
                      onTap: () => quranProvider.isShowDetails =
                          !quranProvider.isShowDetails,
                      child: SingleChildScrollView(
                        child:
                            Column(children: quranPageContent(quranPageModel)),
                      ),
                    ),
                  ),
                ],
              ),
              // bookmark icon
              Align(
                alignment: Alignment.topLeft,
                child: Visibility(
                  visible:
                      quranProvider.markedPageNum == quranPageModel.pageNumber
                          ? true
                          : false,
                  child: Icon(
                    Icons.bookmark,
                    color: kSecondaryColor.withOpacity(.7),
                    size: 72,
                  ),
                ),
              ),
              // page header
              QuranHeader(
                  quranProvider: quranProvider, quranPageModel: quranPageModel),
              // page footer
              QuranFooter(
                  quranProvider: quranProvider, quranPageModel: quranPageModel),
            ],
          ),
        ),
      ),
    );
  }
}
