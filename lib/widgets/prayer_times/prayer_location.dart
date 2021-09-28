import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
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
  var location;
  final loc = ValueNotifier('');

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final lat = widget.prayerTimesProvider.prayerEntity?.lat;
    final lng = widget.prayerTimesProvider.prayerEntity?.lng;
    if (lat == null || lng == null) {
      location = null;
    } else {
      final placemarks = await placemarkFromCoordinates(
        lat,
        lng,
        localeIdentifier: 'ar',
      );
      Fimber.i('placemarksLen= ${placemarks.length}');
      Fimber.i(
          'placemarksSubAdministrativeArea= ${placemarks[1].subAdministrativeArea}');
      loc.value = '${placemarks[0].country} ${placemarks[0].name}  ';
    }
  }

  String getLocationStr() {
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return PrayerDetails(
      mChild: ValueListenableBuilder(
        valueListenable: loc,
        builder: (_, String loc, __) => Text(
          loc,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6?.copyWith(),
        ),
      ),
    );
  }
}
