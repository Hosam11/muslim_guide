import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/app_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';

enum GetLocationStatus { denied, notEnable, deniedForever, locationProblem }

Future<bool> determineLocationStatus(BuildContext context) async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    final x = await locationNotEnable(context);
    return x;
  }
  permission = await Geolocator.checkPermission();
  Fimber.i('permission= $permission');
  switch (permission) {
    case LocationPermission.denied:
      final res = await Geolocator.requestPermission();
      Fimber.i('res= $res');
      if (res == LocationPermission.deniedForever) {
        Fimber.i('res=> deniedForever');
        return await locationDeniedForever(context);
      }
      return false;
    case LocationPermission.deniedForever:
      final x = await locationDeniedForever(context);
      return x;
    case LocationPermission.whileInUse:
    case LocationPermission.always:
      return true;
  }
}

Future<bool> locationNotEnable(BuildContext context) async {
  final positive = await takeActionDialog(
    context: context,
    msg: locationNoEnable,
    positiveBtnStr: openSetting,
    negativeBtnStr: cancel,
  );
  Fimber.i('positive= $positive');
  if (positive != null && positive) {
    final canOpenLocation = await Geolocator.openLocationSettings();
    Fimber.i('canOpenLocation= $canOpenLocation');
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    return serviceEnabled ? true : false;
  }
  return false;
}

Future<bool> locationDeniedForever(BuildContext context) async {
  final positive = await takeActionDialog(
    context: context,
    msg: locationDeniedForEver,
    positiveBtnStr: openSetting,
    negativeBtnStr: cancel,
  );
  if (positive != null && positive) {
    await Geolocator.openAppSettings();
    final res = await Geolocator.checkPermission();
    return res == LocationPermission.always ||
            res == LocationPermission.whileInUse
        ? true
        : false;
  }
  return false;
}

Future<void> getLocationAndSaveIt(
  BuildContext context,
  PrayerTimesProvider prayerProvider,
) async {
  final locStatus = await determineLocationStatus(context);
  Fimber.i('locStatus= $locStatus');
  if (locStatus) {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      Fimber.i('position= $position');
      prayerProvider.curLocation = position;
      await saveLocationToPrefs(position);
    } catch (e) {
      Fimber.i('locationProblem exception =$e');
      await showInfoDialog(context, errorHappened);

      return;
    }
  }
}
