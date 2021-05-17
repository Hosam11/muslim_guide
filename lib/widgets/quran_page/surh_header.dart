import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/styles.dart';

class PageHeader extends StatelessWidget {
  final String surahName;

  const PageHeader({Key key, this.surahName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: kPrimaryBackgroundBoxDecoration,
        child: Column(
          children: [
            // juz and surah name
            Container(
              color: kPrimaryColor,
              padding: const EdgeInsets.symmetric(horizontal: smallestPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    'الجزء الاول',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'الفاتحة',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            // header of page
            // body of page
          ],
        ));
  }
}
