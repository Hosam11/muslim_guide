import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:muslim_guide/constants.dart';
import 'package:muslim_guide/screens/home_screen.dart';
import 'package:muslim_guide/screens/quran_screen.dart';

void main() {
  runApp(MyApp());
}

const double dividerIntent = 10.0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('ar', ''), // Arabic, no country code
      ],
      locale: Locale('ar', 'ar'),
      title: 'Muslim Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: kPrimaryColor,
        dividerTheme: DividerThemeData(
          space: 0,
          thickness: 1.0,
          /* endIndent: dividerIntent,
          indent: dividerIntent,
        */
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        QuranScreen.id: (context) => QuranScreen(),
      },
    );
  }
}
