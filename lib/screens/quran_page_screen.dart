import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/helpers/quran_page_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/widgets/quran/quran_footer.dart';
import 'package:muslim_guide/widgets/quran/quran_header.dart';
import 'package:provider/provider.dart';

class QuranPageScreen extends StatelessWidget {
  QuranPageScreen(this.quranPageModel, [Key? key]) : super(key: key);

  final QuranPage quranPageModel;
  final QuranPageHelper _quranPageHelper = QuranPageHelper.instance;

  @override
  Widget build(BuildContext context) {
    final h = '@@ $runtimeType @@ build() >> ';
    // mLog('$h quranPageContents= \n${jsonEncode(quranPageModel)} ');

    final quranProvider = Provider.of<QuranProvider>(context);

    Fimber.i('bookmarkPageNo= ${quranProvider.markedPageNum},'
        ' curPageNo =${quranPageModel.pageNumber}');
    Fimber.i('sajdaType= ${quranPageModel.sajdaType}');
    return WillPopScope(
      onWillPop: () async =>
          await _quranPageHelper.quranPagePopScope(quranProvider),
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
                        child: Column(
                            children: _quranPageHelper
                                .quranPageContent(quranPageModel)),
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
