import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
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
      appBar: CustomAppBar(title: quranScreenTitle),
      body: SurahsList(),
    );
  }
}

class SurahsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Fimber.i('build()');

    return Container(
      decoration: kSecondaryBackgroundBoxDecoration,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return surahs[index];
        },
        itemCount: surahs.length,
        padding: const EdgeInsets.all(smallPadding),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
