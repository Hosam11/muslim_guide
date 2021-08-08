import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/repository/surahs_repo.dart';
import 'package:muslim_guide/screens/surahs_list_screen.dart';
import 'package:muslim_guide/widgets/surah/surah_item.dart';

final _surahsItems = <SurahItem>[];

/// list of surah to display it in [SurahsListScreen]
List<SurahItem> get surahsItems => _surahsItems;

Future<void> prepareSurahItemsList() async {
  Fimber.i('-');
  final surahList = await getSurahList();
  final surahItemList =
      surahList.map((e) => SurahItem(surah: e)).toList(growable: false);
  Fimber.i('surahItemLen= ${surahItemList.length}');

  _surahsItems.addAll(surahItemList);
}
