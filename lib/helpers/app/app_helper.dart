import 'dart:convert';
import 'dart:developer';

import 'package:appspector/appspector.dart';
import 'package:fimber/fimber.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_guide/data/app_data/allah_names_data.dart';
import 'package:muslim_guide/data/app_data/azkar_data.dart';
import 'package:muslim_guide/data/app_data/quran_page_data.dart';
import 'package:muslim_guide/data/app_data/surah_titles_data.dart';
import 'package:muslim_guide/data/app_data/surahs_data.dart';
import 'package:muslim_guide/data/shared_prefs/perfs.dart';
import 'package:muslim_guide/data/shared_prefs/perfs_keys.dart';
import 'package:connectivity/connectivity.dart';
import 'package:muslim_guide/main.dart' show apiKey;

const isLog = true;

void mLog(String message) {
  isLog ? log('log= ' + message) : print('else');
}

Future<void> prepareDataNeeded() async {
  await prepareSurahHeaders();
  await prepareQuranPagesList();
  await prepareSurahItemsList();
  await prepareAzkarList();
  await prepareAllahNamesList();
}

Future<bool> saveLocationToPrefs(Position location) async {
  final locationJson = location.toJson();
  final locationStr = jsonEncode(locationJson);

  final saveState = await setString(value: locationStr, key: locationKey);
  return saveState;
}

/// return [Position]. or false if there is no location stored
dynamic getLocationFromPref() {
  final locationStr = getString(
    key: locationKey,
    defaultValue: locationDefaultKey,
  );
  Fimber.i('locationStr= $locationStr');
  if (locationStr != locationDefaultKey) {
    final locationMap = jsonDecode(locationStr);
    final location = Position.fromMap(locationMap);
    return location;
  } else {
    return false;
  }
}

Future<bool> checkInternet() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi
      ? true
      : false;
}

// FIXME: delete #1 in production
void runAppSpector() {
  final config = Config()..androidApiKey = apiKey;
  int? x;
  x?.isOdd;
  // If you don't want to start all monitors you can specify a list of necessary ones
  config.monitors = <Monitor>[
    Monitors.http,
    Monitors.logs,
    Monitors.fileSystem,
    Monitors.screenshot,
    Monitors.environment,
    Monitors.location,
    Monitors.performance,
    Monitors.sqLite,
    Monitors.sharedPreferences,
    Monitors.analytics,
    Monitors.notification,
    Monitors.userDefaults,
    Monitors.coreData
  ];

  AppSpectorPlugin.run(config);
}
