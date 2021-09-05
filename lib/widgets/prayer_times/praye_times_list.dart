import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';

class PrayerTimesList extends StatelessWidget {
  PrayerTimesList({Key? key, required this.prayerTimesProvider})
      : super(key: key);

  final PrayerTimesProvider prayerTimesProvider;
  @override
  Widget build(BuildContext context) {
    Fimber.i('times = ${prayerTimesProvider.prayerEntity}');
    Fimber.i('prayerEntity= ${prayerTimesProvider.prayerEntity}');
    return prayerTimesProvider.prayerEntity != null
        ? ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(smallDimens),
            itemBuilder: (_, index) =>
                prayerTimesProvider.prayersCardWidget[index],
            itemCount: prayerTimesProvider.prayersCardWidget.length,
            separatorBuilder: (_, __) => const Divider(),
          )
        : const SizedBox();
  }
}
