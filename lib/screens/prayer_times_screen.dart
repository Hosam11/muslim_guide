import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/data/repository/prayer_times_repo.dart';
import 'package:muslim_guide/helpers/after_layout.dart';
import 'package:muslim_guide/helpers/app_dialogs.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/services/location_service.dart';
import 'package:muslim_guide/services/util/urls.dart';
import 'package:muslim_guide/widgets/prayer_time_card.dart';
import 'package:muslim_guide/widgets/shared/custom_appbar.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({Key key}) : super(key: key);

  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen>
    with AfterLayoutMixin {
  var counter = 0;

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    final loc = await getLocation();
    Fimber.i('loc= $loc');
    if (loc is Position) {
      await getPrayerTimes(lng: loc.longitude, lat: loc.latitude);
    }
  }

  Future<Position> getLocation() async {
    // return Position if stored or false if empty
    final location = await getLocationFromPref();
    Fimber.i('location= $location');
    if (location is Position) {
      return location;
    } else if (!location) {
      // get location
      return await locationNotExist();
    }
  }

  Future<dynamic> locationNotExist() async {
    // return true if or false
    final locationRes = await getLocationAndSaveIt(context);
    Fimber.i('locationRes= $locationRes');
    if (locationRes) {
      return await getLocationFromPref();
    } else {
      counter++;
      if (counter >= 2) {
        Fimber.i('counter= $counter');
        return;
      } else {
        await locationNotExist();
      }
      /*final res = await takeActionDialog(
        context: context,
        msg: locationError,
        negativeBtnStr: discard,
      );
      Fimber.i('res= $res');
      if (res != null && res) {
        return await locationNotExist();
      } else {
        Navigator.of(context).pop();
      }*/
    }
  }

  Future<void> getPrayerTimes({
    @required double lat,
    @required double lng,
  }) async {
    final now = DateTime.now();
    final url = prayerTimesUrl(
      lat: lat,
      lng: lng,
      month: now.month,
      year: now.year,
    );
    final ss = await PrayerTimesRepo.instance.getPrayerTimes(url);
    Fimber.i('ss= $ss');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: prayerTimesTitle),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: kSecondaryBackgroundBoxDecoration,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide()),
          ),
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
      ),
    );
  }
}
