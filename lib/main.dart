import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/locals.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/helpers/quran_helper.dart';
import 'package:muslim_guide/routes.dart' as routes;
import 'package:muslim_guide/routes.dart';

import 'data/repository/quran_repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fimber.plantTree(DebugTree.elapsed());
  await getData();
  runApp(MyApp());
}

Future<void> getData() async {
  //var x = await QuranRepo.getPages();
  //print('##SurahScreen## getData() data= $x');
  // MUST call it before access quranPages list in repo
  // await QuranRepo.instance.getPages();
  //print('len= ${QuranRepo.instance.quranPages?.length}');

  // fixme: put the below lines inside [splash screen ]
  ///
  await AppHelper.instance.prepareSurahItemsList();

  await QuranRepo.instance.getQuranPages();
  // await QuranHelper.instance.testPrepareQuranPageContents(113);

  // final x = QuranRepo.instance.getQuranPage(2);
  // print('numberAyahMap for page1= ${x['ayahNumberMap']}');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Fimber.i('headline6 = ${Theme.of(context).textTheme.headline6.fontSize}');
    Fimber.i('headline5 = ${Theme.of(context).textTheme.headline5.fontSize}');
    Fimber.i('subtitle1 = ${Theme.of(context).textTheme.subtitle1.fontSize}');
    Fimber.i('subtitle2 = ${Theme.of(context).textTheme.subtitle2.fontSize}');
    Fimber.i('bodyText1 = ${Theme.of(context).textTheme.bodyText1.fontSize}');
    Fimber.i('bodyText2 = ${Theme.of(context).textTheme.bodyText2.fontSize}');
    Fimber.i('caption = ${Theme.of(context).textTheme.caption.fontSize}');
    Fimber.i('overline = ${Theme.of(context).textTheme.overline.fontSize}');
    Fimber.i('button = ${Theme.of(context).textTheme.button.fontSize}');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocals,
      locale: curLocal,
      title: appTitle,

      // when changing those values
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        // fontFamily: GoogleFonts.tajawal,
        textTheme: GoogleFonts.tajawalTextTheme().copyWith(
          headline5: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: kTextColor),
          subtitle1: TextStyle(color: kTextColor),
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor),
          caption: TextStyle(color: kTextColor),
        ),
        dividerTheme: const DividerThemeData(
          space: 0,
          thickness: 1.0,
          color: kTextColor,
          /* endIndent: dividerIntent,
              indent: dividerIntent, */
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: routes.homeScreen,
      onGenerateRoute: generateRoutes,
    );
  }
}
