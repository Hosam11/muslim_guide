import 'dart:developer';

import 'package:appspector/appspector.dart';
import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/models/surah/surah.dart';
import 'package:muslim_guide/data/repository/app_repo.dart';
import 'package:muslim_guide/screens/quran_page_controller.dart';
import 'package:muslim_guide/screens/quran_page_screen.dart';
import 'package:muslim_guide/screens/surahs_list_screen.dart';
import 'package:muslim_guide/widgets/surah/surah_name_title.dart';
import 'package:muslim_guide/widgets/surah_item.dart';

const isLog = true;

void mLog(String message) {
  isLog ? log('log= ' + message) : print('else');
}

const apiKey = 'android_ZmQ0NzQwNjQtMmYwNy00ZjlkLTlkZDctZTY5MTllMmE2ZWJm';

class AppHelper {
  AppHelper._privateConstructor();

  static final AppHelper instance = AppHelper._privateConstructor();

  final AppRepo _appRepo = AppRepo.instance;
  // final QuranRepo _quranRepo = QuranRepo.instance;

  final List<Surah> _surahHeaders = [];

  final _surahsItems = <SurahItem>[];
  final _quranPageScreen = <QuranPageScreen>[];

  /// use it to extract numberOfAyahs and rank from [Surah] to use it in
  /// [SurahNameTitle]
  List<Surah> get surahHeaders => _surahHeaders;

  /// list of surah to display it in [SurahsListScreen]
  List<SurahItem> get surahsItems => _surahsItems;

  /// list of quran pages to set it in [QuranPageController] to hold all quran
  /// pages
  List<QuranPageScreen> get quranPageScreen => _quranPageScreen;

  Future<void> prepareDataNeeded() async {
    await _prepareSurahItemsList();
    await _prepareQuranPagesList();
    await _prepareSurahHeaders();
  }

  Future<void> _prepareSurahHeaders() async {
    final surahHeadersList = await _appRepo.getSurahHeaders();
    _surahHeaders.addAll(surahHeadersList);
  }

  Future<void> _prepareSurahItemsList() async {
    Fimber.i('-');
    final surahList = await _appRepo.getSurahList();
    final surahItemList =
        surahList.map((e) => SurahItem(surah: e)).toList(growable: false);
    Fimber.i('surahItemLen= ${surahItemList.length}');

    _surahsItems.addAll(surahItemList);
  }

  Future<void> _prepareQuranPagesList() async {
    final quranPages = await _appRepo.getQuranPages();
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


}
