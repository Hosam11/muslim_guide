import 'dart:developer';

import 'package:appspector/appspector.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:muslim_guide/constants/app_colors.dart';
import 'package:muslim_guide/constants/dimens.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/data/repository/surah_repo.dart';
import 'package:muslim_guide/screens/quran_page_controller.dart';
import 'package:muslim_guide/screens/quran_page_screen.dart';
import 'package:muslim_guide/screens/surahs_list_screen.dart';
import 'package:muslim_guide/widgets/surah_item.dart';

const isLog = true;

void mLog(String message) {
  isLog ? log('log= ' + message) : print('else');
}

const apiKey = 'android_ZmQ0NzQwNjQtMmYwNy00ZjlkLTlkZDctZTY5MTllMmE2ZWJm';

class AppHelper {
  AppHelper._privateConstructor();

  static final AppHelper instance = AppHelper._privateConstructor();

  final SurahRepo _surahRepo = SurahRepo.instance;
  final QuranRepo _quranRepo = QuranRepo.instance;

  final _surahsItems = <SurahItem>[];
  final _quranPageScreen = <QuranPageScreen>[];

  /// list of surah to display it in [SurahsListScreen]
  List<SurahItem> get surahsItems => _surahsItems;

  /// list of quran pages to set it in [QuranPageController] to hold all quran
  /// pages
  List<QuranPageScreen> get quranPageScreen => _quranPageScreen;

  Future<void> prepareDataNeeded() async {
    await _prepareSurahItemsList();
    await _prepareQuranPagesList();
  }

  Future<void> _prepareSurahItemsList() async {
    Fimber.i('-');
    final surahList = await _surahRepo.getSurahList();
    final surahItemList =
        surahList.map((e) => SurahItem(surah: e)).toList(growable: false);
    Fimber.i('surahItemLen= ${surahItemList.length}');

    _surahsItems.addAll(surahItemList);
  }

  Future<void> _prepareQuranPagesList() async {
    final quranPages = await _quranRepo.getQuranPages();
    final pagesContentList = quranPages.map((e) => QuranPageScreen(e)).toList();
    _quranPageScreen.addAll(pagesContentList);
  }

  // FIXME: delete #1 in production
  void runAppSpector() {
    final config = Config()..androidApiKey = apiKey;

    // If you don't want to start all monitors you can specify a list of necessary ones
    config.monitors = <Monitor>[
      Monitors.http,
      Monitors.logs,
      Monitors.fileSystem,
      Monitors.screenshot,
      Monitors.environment,
      Monitors.location,
      Monitors.performance,
      Monitors.sqLite,
      Monitors.sharedPreferences,
      Monitors.analytics,
      Monitors.notification,
      Monitors.userDefaults,
      Monitors.coreData
    ];

    AppSpectorPlugin.run(config);
  }

  Future<void> showMyDialog(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('هل تريد وضع علامه علي هذة الصفحة ؟'),
        backgroundColor: kSecondaryColor,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            child: const Text('نعم'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff459a81),
            ),
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('لا'),
          ),
        ],
      ),
    );
  }

  Future<dynamic> confirmationDialog(
    BuildContext context,
  ) {
    return showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          confirmBookmark,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kSecondaryColor,
        elevation: 0.6,
        content: Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  child: Text(
                    yes,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff459a81),
                  ),
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    no,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
