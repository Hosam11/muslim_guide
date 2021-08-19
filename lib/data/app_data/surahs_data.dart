import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/repository/surahs_repo.dart';
import 'package:muslim_guide/screens/surahs_list_screen.dart';
import 'package:muslim_guide/widgets/surah/surah_item.dart';

late final List<SurahItem> _surahsItems;

/// list of surah to display it in [SurahsListScreen]
List<SurahItem> get surahsItems => _surahsItems;

Future<void> prepareSurahItemsList() async {
  final surahList = await getSurahList();
  _surahsItems =
      surahList.map((e) => SurahItem(surah: e)).toList(growable: false);
  Fimber.i('surahItemLen= ${_surahsItems.length}');
}
