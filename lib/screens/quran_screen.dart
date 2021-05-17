import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart' as colors;
import 'package:muslim_guide/constants/dimens.dart' as dimens;
import 'package:muslim_guide/constants/strings.dart' as strings;
import 'package:muslim_guide/constants/styles.dart' as styles;
import 'package:muslim_guide/shared/custom_appbar.dart';
import 'package:muslim_guide/widgets/surah_item.dart';

final List<SurahItem> surahs = [
  SurahItem(
    name: 'الفاتحة',
    surahNumber: 1,
    numberOfAyahs: 7,
    revelationType: 'مكية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 2,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 3,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'الفاتحة',
    surahNumber: 4,
    numberOfAyahs: 7,
    revelationType: 'مكية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 5,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 6,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'الفاتحة',
    surahNumber: 7,
    numberOfAyahs: 7,
    revelationType: 'مكية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 8,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 9,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'الفاتحة',
    surahNumber: 10,
    numberOfAyahs: 7,
    revelationType: 'مكية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 11,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 12,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
];

class QuranScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: strings.quranScreenTitle),
      body: Container(
        decoration: styles.kSecondaryBackgroundBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.only(
            left: dimens.mediumPadding,
            right: dimens.mediumPadding,
            top: dimens.mediumPadding,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: colors.kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(dimens.smallPadding),
                topRight: Radius.circular(dimens.smallPadding),
              ),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) => surahs[index],
              itemCount: surahs.length,
              padding: const EdgeInsets.all(dimens.smallPadding),
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ),
      ),
    );
  }
}
