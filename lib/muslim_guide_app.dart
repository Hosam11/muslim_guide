import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/app_theme.dart';
import 'package:muslim_guide/constants/constants_imports.dart';
import 'package:muslim_guide/constants/locals.dart';
import 'package:muslim_guide/constants/strings.dart';

import 'package:muslim_guide/routes.dart';

class MuslimGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Fimber.i('headline6 = ${Theme.of(context).textTheme.headline6!.fontSize}, '
        'headline5 = ${Theme.of(context).textTheme.headline5!.fontSize}, '
        'headline4 = ${Theme.of(context).textTheme.headline4!.fontSize}, '
        'headline3 = ${Theme.of(context).textTheme.headline3!.fontSize}, '
        'headline2 = ${Theme.of(context).textTheme.headline2!.fontSize}, '
        'headline1 = ${Theme.of(context).textTheme.headline1!.fontSize}, '
        'subtitle1 = ${Theme.of(context).textTheme.subtitle1!.fontSize}, '
        'subtitle2 = ${Theme.of(context).textTheme.subtitle2!.fontSize}, '
        'bodyText1 = ${Theme.of(context).textTheme.bodyText1!.fontSize}, '
        'bodyText2 = ${Theme.of(context).textTheme.bodyText2!.fontSize}, '
        'caption = ${Theme.of(context).textTheme.caption!.fontSize}, '
        'overline = ${Theme.of(context).textTheme.overline!.fontSize}, '
        'button = ${Theme.of(context).textTheme.button!.fontSize} ');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocals,
      locale: curLocal,
      title: appTitle,
      // fixme: app themeData in appTheme leave it for now for hot realod to work
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            elevation: elevation,
            backgroundColor: kPrimaryColor,
            side: const BorderSide(color: kTextColor),
          ),
        ),
// fontFamily: GoogleFonts.tajawal,
        textTheme: GoogleFonts.tajawalTextTheme().copyWith(
          headline5:
              const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          headline6:
              const TextStyle(color: kTextColor, fontWeight: FontWeight.normal),
          headline4: const TextStyle(color: kTextColor),
          headline1: const TextStyle(color: kTextColor),
          headline3: const TextStyle(color: kTextColor),
          headline2: const TextStyle(color: kTextColor),
          subtitle1: const TextStyle(color: kTextColor),
          subtitle2: const TextStyle(color: kTextColor),
          bodyText1: const TextStyle(color: kTextColor),
          bodyText2: const TextStyle(color: kTextColor),
          caption: const TextStyle(color: kTextColor),
        ) // .apply(bodyColor: kTextColor, displayColor: Colors.blue)
        ,

        dividerTheme: const DividerThemeData(
          space: 0,
          thickness: 1.0,
          color: kTextColor,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: splashScreen,
      onGenerateRoute: generateRoutes,
    );
  }
}
