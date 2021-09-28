import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/constants/locals.dart';
import 'package:muslim_guide/helpers/prayer_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';

class HijriDate extends StatelessWidget {
  final PrayerTimesProvider prayerTimesProvider;
  const HijriDate({
    Key? key,
    required this.prayerTimesProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timestamp = prayerTimesProvider.prayerEntity?.timestamp;
    Fimber.i('timestamp= $timestamp');
    final hijriDate;
    if (timestamp != null) {
      final date = PrayerHelper.instance.dateFromTimeStamp(timestamp);
      Fimber.i('date= $date');
      hijriDate = PrayerHelper.instance.getHijriDate(date);
      Fimber.i('hijriDate= $hijriDate');
    } else {
      hijriDate = null;
    }

    final formatter = DateFormat('dd MMMM yyyy', curLocal.countryCode);
    final date = formatter.format(DateTime.now());

    return PrayerDetails(
      mChild: Row(
        children: [
          Expanded(
            child: Text(
              hijriDate ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6?.copyWith(),
            ),
          ),
          const SizedBox(width: mediumDimens),
          Expanded(
            child: Text(
              date,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6?.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}

class PrayerDetails extends StatelessWidget {
  const PrayerDetails({Key? key, required this.mChild}) : super(key: key);

  final Widget mChild;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: smallDimens,
        left: smallDimens,
        right: smallDimens,
        bottom: smallDimens,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(smallDimens),
        decoration: BoxDecoration(
          borderRadius: kSmallBorderRadius,
          color: kPrimaryColor,
        ),
        child: mChild,
      ),
    );
  }
}
