import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_theme.dart';
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
      theme: appThemeData,
      initialRoute: routes.homeScreen,
      routes: routes.routes,
    );
  }
}
