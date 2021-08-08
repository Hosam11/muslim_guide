import 'dart:developer';

import 'package:appspector/appspector.dart';
import 'package:muslim_guide/data/app_data/azkar_data.dart';
import 'package:muslim_guide/data/app_data/quran_data.dart';
import 'package:muslim_guide/data/app_data/surah_titles_data.dart';
import 'package:muslim_guide/data/app_data/surahs_data.dart';

const isLog = true;

void mLog(String message) {
  isLog ? log('log= ' + message) : print('else');
}

const apiKey = 'android_ZmQ0NzQwNjQtMmYwNy00ZjlkLTlkZDctZTY5MTllMmE2ZWJm';

Future<void> prepareDataNeeded() async {
  await prepareSurahHeaders();
  await prepareQuranPagesList();
  await prepareSurahItemsList();
  await prepareAzkarList();
}

// FIXME: delete #1 in production
void runAppSpector() {
  final config = Config()..androidApiKey = apiKey;

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
