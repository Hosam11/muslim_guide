import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/muslim_guide_app.dart';

import 'package:muslim_guide/helpers/app/app_helper.dart';
import 'package:muslim_guide/providers/prayer_times_provider.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:provider/provider.dart';

// const apiKey = 'android_YmZjYWJhMGYtOGE4NS00YjA2LWExOTMtYjg0OWM3ZjQxMGQx';
// const apiKey = 'android_ZmQ0NzQwNjQtMmYwNy00ZjlkLTlkZDctZTY5MTllMmE2ZWJm';
// const apiKey = 'android_NGU0MTQ4MDMtMDc2NS00NzE3LWJhYTctZTMzNGM0YWIwMDgz';
// const apiKey = 'android_MWM3Yzk0OTMtZDE4MC00MDMxLTg5NjUtMTFhYWM5YjRiMGQx';
// const apiKey = 'android_ZGE3YmY3MzMtODQ0NS00YmIyLThiMzQtNTAzZmZkMDkwNDJi';
const apiKey = 'android_OGMwYmNhMWItNGRmNy00ZWFmLWJiYmQtODQxZTM2ODk2MjVm';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runAppSpector();
  Fimber.plantTree(DebugTree.elapsed());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<QuranProvider>(create: (_) => QuranProvider()),
        ChangeNotifierProvider<PrayerTimesProvider>(
            create: (_) => PrayerTimesProvider()),
      ],
      child: MuslimGuideApp(),
    ),
  );
}
