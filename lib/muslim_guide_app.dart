import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/locals.dart';
import 'package:muslim_guide/constants/strings.dart';

import 'package:muslim_guide/routes.dart';

class MuslimGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Fimber.i('headline6 = ${Theme.of(context).textTheme.headline6.fontSize}, '
        'headline5 = ${Theme.of(context).textTheme.headline5.fontSize}, '
        'subtitle1 = ${Theme.of(context).textTheme.subtitle1.fontSize}, '
        'subtitle2 = ${Theme.of(context).textTheme.subtitle2.fontSize}, '
        'bodyText1 = ${Theme.of(context).textTheme.bodyText1.fontSize}, '
        'bodyText2 = ${Theme.of(context).textTheme.bodyText2.fontSize}, '
        'caption = ${Theme.of(context).textTheme.caption.fontSize}, '
        'overline = ${Theme.of(context).textTheme.overline.fontSize}, '
        'button = ${Theme.of(context).textTheme.button.fontSize} ');

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
          subtitle2: TextStyle(color: kTextColor),
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
      initialRoute: splashScreen,
      onGenerateRoute: generateRoutes,
    );
  }
}
