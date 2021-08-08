import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/helpers/quran_page_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:muslim_guide/widgets/quran/page_bookmark.dart';
import 'package:muslim_guide/widgets/quran/page_title.dart';

class QuranFooter extends StatelessWidget {
  const QuranFooter({
    Key key,
    @required this.quranProvider,
    @required this.quranPageModel,
  }) : super(key: key);

  final QuranProvider quranProvider;
  final NewQuranPage quranPageModel;

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
                  ? onBookmarkPressed(
                      quranPageModel.pageNumber, quranProvider, context)
                  : null,
              onRestoreBookmarkPressed: () => quranProvider.isShowDetails
                  ? onRestoreBookmarkPressed(context)
                  : null,
            ),
            Divider(
              color: Colors.white24,
            ),
            PageTitle(
              left: createPageNumber(quranPageModel.pageNumber),
              right: createHizbQuarter(
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
