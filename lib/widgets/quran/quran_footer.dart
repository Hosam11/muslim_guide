import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/helpers/quran_page_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/widgets/quran/page_bookmark.dart';
import 'package:muslim_guide/widgets/quran/page_title.dart';

class QuranFooter extends StatelessWidget {
  QuranFooter({
    Key? key,
    required this.quranProvider,
    required this.quranPageModel,
  }) : super(key: key);

  final QuranProvider quranProvider;
  final QuranPage quranPageModel;
  final QuranPageHelper _quranPageHelper = QuranPageHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        opacity: quranProvider.isShowDetails ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PageBookmark(
              onBookmarkPressed: () => quranProvider.isShowDetails
                  ? _quranPageHelper.onBookmarkPressed(
                      quranPageModel.pageNumber, quranProvider, context)
                  : null,
              onRestoreBookmarkPressed: () => quranProvider.isShowDetails
                  ? _quranPageHelper.onRestoreBookmarkPressed(context)
                  : null,
            ),
            const Divider(color: Colors.white24),
            PageTitle(
              left:
                  _quranPageHelper.createPageNumber(quranPageModel.pageNumber),
              right: _quranPageHelper.createHizbQuarter(
                quarter: quranPageModel.quarter,
                hizb: quranPageModel.hizb,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
