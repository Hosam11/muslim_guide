import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:muslim_guide/constants/locals.dart';
import 'package:muslim_guide/helpers/app/after_layout.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/widgets/prayer_times/hijri_date.dart';

class PrayerLocation extends StatefulWidget {
  const PrayerLocation({Key? key, required this.prayerTimesProvider})
      : super(key: key);
  final PrayerTimesProvider prayerTimesProvider;

  @override
  _PrayerLocationState createState() => _PrayerLocationState();
}

class _PrayerLocationState extends State<PrayerLocation> with AfterLayoutMixin {
  final loc = ValueNotifier('');

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final lat = widget.prayerTimesProvider.prayerEntity?.lat;
    final lng = widget.prayerTimesProvider.prayerEntity?.lng;
    Fimber.i('afterFirstLayout >> lat= $lat, lng= $lng  ');
    if (!(lat == null || lng == null)) {
      final placeMarks = await placemarkFromCoordinates(
        lat,
        lng,
        localeIdentifier: curLocal.countryCode,
      );
      Fimber.i('placeMarksLen= ${placeMarks.length}');
      Fimber.i(
          'placeMarksSubAdministrativeArea= ${placeMarks[1].subAdministrativeArea}');
      loc.value = '${placeMarks[0].country} ${placeMarks[0].name}  ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loc,
      builder: (_, String loc, __) => loc.isEmpty
          ? const SizedBox()
          : PrayerDetails(
              mChild: Text(
                loc,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6?.copyWith(),
              ),
            ),
    );
  }
}
