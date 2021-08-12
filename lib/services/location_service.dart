import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/helpers/app_dialogs.dart';

enum GetLocationStatus { denied, notEnable, deniedForever, locationProblem }

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
          desiredAccuracy: LocationAccuracy.high,
        );
      } catch (e) {
        Fimber.i('e=$e');
        return GetLocationStatus.locationProblem;
      }
      return position;
  }
}

/// [Position] if we success to got location
/// [bool] if there is problem with permission
Future<dynamic> getUserLocation(BuildContext context) async {
  final dynamic locationResult = await _determineLocationStatus();
  Fimber.i('locationResult= $locationResult');
  if (locationResult is GetLocationStatus) {
    switch (locationResult) {
      case GetLocationStatus.denied:
        final res = await Geolocator.requestPermission();
        if (res == LocationPermission.deniedForever) {
          await locationDeniedForever(context);
        }
        return false;

      case GetLocationStatus.notEnable:
        // show dialog ask to open setting
        await locationNotEnable(context);
        return false;

      case GetLocationStatus.deniedForever:
        await locationDeniedForever(context);
        return false;

      case GetLocationStatus.locationProblem:
        await showInfoDialog(context, errorHappened);
        return false;
    }
  } else if (locationResult is Position) {
    return locationResult;
  }
}

Future<void> locationNotEnable(BuildContext context) async {
  final positive = await takeActionDialog(
    context: context,
    msg: locationNoEnable,
    positiveBtnStr: openSetting,
    negativeBtnStr: cancel,
  );
  if (positive != null && positive) {
    await Geolocator.openLocationSettings();
  }
}

Future<void> locationDeniedForever(BuildContext context) async {
  final positive = await takeActionDialog(
    context: context,
    msg: locationDeniedForEver,
    positiveBtnStr: openSetting,
    negativeBtnStr: cancel,
  );
  if (positive) {
    await Geolocator.openAppSettings();
  }
}
