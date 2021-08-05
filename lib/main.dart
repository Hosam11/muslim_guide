import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/musli_guide_app.dart';

import 'package:muslim_guide/data/shared_prefs/perfs.dart' as prefs;
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/providers/quran_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppHelper.instance.runAppSpector();

  Fimber.plantTree(DebugTree.elapsed());
  await getData();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => QuranProvider(),
      child: MuslimGuideApp(),
    ),
  );
}

// fixme: put the below lines inside [splash screen ]
Future<void> getData() async {
  //var x = await QuranRepo.getPages();
  //print('##SurahScreen## getData() data= $x');
  // MUST call it before access quranPages list in repo
  // await QuranRepo.instance.getPages();
  //print('len= ${QuranRepo.instance.quranPages?.length}');

  await prefs.init();

  await AppHelper.instance.prepareDataNeeded();

  // await QuranRepo.instance.getQuranPages();
  // await QuranHelper.instance.testPrepareQuranPageContents(113);

  // final x = QuranRepo.instance.getQuranPage(2);
  // print('numberAyahMap for page1= ${x['ayahNumberMap']}');
}
