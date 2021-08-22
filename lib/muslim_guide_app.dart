import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
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
      theme: appThemeData,
      initialRoute: splashScreen,
      onGenerateRoute: generateRoutes,
    );
  }
}
