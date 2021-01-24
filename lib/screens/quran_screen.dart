import 'package:flutter/material.dart';
import 'package:muslim_guide/constants.dart';
import 'package:muslim_guide/widgets/custom_appbar.dart';
import 'package:muslim_guide/widgets/surah_item.dart';

final List<SurahItem> surahs = [
  SurahItem(
    name: 'الفاتحة',
    surahNumber: 01,
    numberOfAyahs: 7,
    revelationType: 'مكية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 21,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 2,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'الفاتحة',
    surahNumber: 1,
    numberOfAyahs: 7,
    revelationType: 'مكية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 22,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
  SurahItem(
    name: 'البقرة',
    surahNumber: 2,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
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
    surahNumber: 2,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
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
    surahNumber: 2,
    numberOfAyahs: 286,
    revelationType: 'مدنية',
  ),
];

const String screenTitle = 'سور القرآن';

class QuranScreen extends StatelessWidget {
  static const String id = 'quran_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: screenTitle),
      body: SurahsList(),
    );
  }
}

class SurahsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBackgroundBoxDecoration,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return surahs[index];
        },
        itemCount: surahs.length,
        padding: EdgeInsets.all(8.0),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => Divider(),
      ),
    );
  }
}
