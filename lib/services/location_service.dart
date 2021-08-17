import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/helpers/app/app_dialogs.dart';
import 'package:muslim_guide/helpers/app/app_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';

enum GetLocationStatus { denied, notEnable, deniedForever, locationProblem }

/*
/// get current location of user
/// return 2 option [GetLocationStatus] and [Position]
///
/// First: [GetLocationStatus] indicate to 3 status of [LocationPermission]
/// [GetLocationStatus.denied], [GetLocationStatus.notEnable]
/// and [GetLocationStatus.deniedForever] and [GetLocationStatus.locationProblem]
/// that means exception happened wile get location
///
/// Second: if there is no error happened [Position] of user will return
Future<dynamic> _determineLocationStatus() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();

  if (!serviceEnabled) {
    return GetLocationStatus.notEnable;
  }
  permission = await Geolocator.checkPermission();
  Fimber.i('permission= $permission');
  switch (permission) {
    case LocationPermission.denied:
      return GetLocationStatus.denied;

    case LocationPermission.deniedForever:
      return GetLocationStatus.deniedForever;

    case LocationPermission.whileInUse:
    case LocationPermission.always:
      Position position;
      try {
        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      } catch (e) {
        Fimber.i('locationProblem exception =$e');
        return GetLocationStatus.locationProblem;
      }
      return position;
  }
}
*/

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

/*
/// [Position] if we success to got location
/// [bool] return false if not location
Future<dynamic> _getUserLocation(BuildContext context) async {
  final dynamic locationResult = await _determineLocationStatus();
  Fimber.i('locationResult= $locationResult');
  if (locationResult is GetLocationStatus) {
    switch (locationResult) {
      case GetLocationStatus.denied:
        final res = await Geolocator.requestPermission();
        if (res == LocationPermission.deniedForever) {
          Fimber.i('res= $res');
          return await locationDeniedForever(context);
        }
        return false;
      case GetLocationStatus.notEnable:
        // show dialog ask to open setting
        return await locationNotEnable(context);

      case GetLocationStatus.deniedForever:
        return await locationDeniedForever(context);

      case GetLocationStatus.locationProblem:
        await showInfoDialog(context, errorHappened);
        return false;
    }
  } else if (locationResult is Position) {
    return locationResult;
  }
}
*/

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

/// return true if location successfully got and saved tp shared prefs
/// else return false if there is problem with location
/*Future<bool> getLocationAndSaveIt(BuildContext context) async {
  final res = await _getUserLocation(context);
  Fimber.i('res= $res');
  if (res is! bool) {
    return await saveLocationToPrefs(res);
  } else {
    return false;
  }
}*/

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
