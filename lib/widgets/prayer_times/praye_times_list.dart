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
    Fimber.i('times = ${prayerTimesProvider.prayerTimings}');
    // var x = _prayerHelper.convert24To12('12:22 (EET)');
    var x = 01;
    Fimber.i('xxxxxxxxxxxxxxxxx= ${x}');
    return prayerTimesProvider.prayerTimings != null
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
