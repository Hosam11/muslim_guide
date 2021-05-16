import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
    <LocalizationsDelegate<dynamic>>[
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

const List<Locale> supportedLocals = <Locale>[
  Locale('en', ''), // English, no country code
  Locale('ar', ''), // Arabic, no country code
];

const Locale curLocal = Locale('ar', 'ar');
