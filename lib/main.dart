import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/fonts.dart';
import 'package:muslim_guide/constants/locals.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/routes.dart' as routes;

void main() {
  Fimber.plantTree(DebugTree.elapsed());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocals,
      locale: curLocal,
      title: appTitle,

      // fixme: put that inside it's file leave it for now to avoid hot restart
      // when changing those values
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        fontFamily: tajawalReg,
        textTheme: TextTheme().copyWith(
          headline5: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          headline6: TextStyle(color: kTextColor),
          subtitle1: TextStyle(color: kTextColor),
          bodyText1: TextStyle(color: kTextColor),
        ),
        dividerTheme: const DividerThemeData(
            space: 0, thickness: 1.0, color: kTextColor
            /* endIndent: dividerIntent,
              indent: dividerIntent, */
            ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: routes.homeScreen,
      routes: routes.routes,
    );
  }
}
