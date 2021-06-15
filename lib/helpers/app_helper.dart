import 'dart:developer';

import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/repository/surah_repo.dart';
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

  final _surahsItems = <SurahItem>[];

  /// list of surah to display it in [SurahsListScreen]
  List<SurahItem> get surahsItems => _surahsItems;

  Future<void> prepareSurahItemsList() async {
    Fimber.i('-');
    final surahList = await _surahRepo.getSurahList();
    final surahItemList =
        surahList.map((e) => SurahItem(surah: e)).toList(growable: false);
    Fimber.i('surahItemLen= ${surahItemList.length}');

    _surahsItems.addAll(surahItemList);
  }

  void prepareQuranPagesList() {}
}
