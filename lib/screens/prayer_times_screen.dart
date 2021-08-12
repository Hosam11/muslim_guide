import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/constants/styles.dart';
import 'package:muslim_guide/widgets/prayer_time_card.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class PrayerTimesScreen extends StatelessWidget {
  const PrayerTimesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: prayerTimesTitle),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kSecondaryBackgroundBoxDecoration,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(smallDimens),
          itemBuilder: (_, int index) => const PrayerTimesCard(
            img: noonImg,
            prayerName: fajr,
            prayerTime: '30:01',
          ),
          itemCount: 2,
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
    );
  }
}
