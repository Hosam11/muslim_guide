import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/data/models/new_quran_pages/new_quran_page.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:provider/provider.dart';

class PageBookmark extends StatelessWidget {
  const PageBookmark({
    Key key,
    this.onBookmarkPressed,
    this.onRestoreBookmarkPressed,
    this.quranPageModel,
  }) : super(key: key);

  final void Function() onBookmarkPressed;
  final void Function() onRestoreBookmarkPressed;
  final NewQuranPage quranPageModel;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.subtitle1;
    final quranProvider = Provider.of<QuranProvider>(context);
    Fimber.i('quranProvider ${quranProvider.hashCode}');
    Fimber.i(' isBookmark=  ${quranProvider.isBookmark}');

    return Container(
      decoration: pagePopupDecoration,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: onBookmarkPressed,
                child: ListTile(
                  horizontalTitleGap: 0,
                  dense: true,
                  title: Text(addBookmark, style: textStyle),
                  leading: Icon(Icons.bookmark, color: Colors.white),
                ),
              ),
            ),
            VerticalDivider(color: Colors.white24, thickness: 2),
            Expanded(
              child: InkWell(
                onTap: onRestoreBookmarkPressed,
                child: ListTile(
                  horizontalTitleGap: 0,
                  title: Text(restoreBookmark, style: textStyle),
                  leading: Icon(
                    Icons.bookmark,
                    color: quranProvider.isBookmark
                        ? kSecondaryColor
                        : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
