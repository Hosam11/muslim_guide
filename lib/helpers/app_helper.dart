import 'dart:developer';

import 'package:fimber/fimber.dart';
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

class AppHelper {
  AppHelper._privateConstructor();

  static final AppHelper instance = AppHelper._privateConstructor();

  final SurahRepo _surahRepo = SurahRepo.instance;
  final QuranRepo _quranRepo = QuranRepo.instance;

  final _surahsItems = <SurahItem>[];
  final _quranPageScreen = <QuranPageScreen>[];

  /// list of surah to display it in [SurahsListScreen]
  List<SurahItem> get surahsItems => _surahsItems;

  /// list of quran pages to set it in [QuranPageController] to hild all quran
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
    final pagesContentList =
        quranPages.map((e) => QuranPageScreen(quranPageModel: e)).toList();
    _quranPageScreen.addAll(pagesContentList);
  }
}
