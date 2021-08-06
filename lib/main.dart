import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/muslim_guide_app.dart';

import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppHelper.instance.runAppSpector();
  Fimber.plantTree(DebugTree.elapsed());

  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => QuranProvider(),
      child: MuslimGuideApp(),
    ),
  );
}
