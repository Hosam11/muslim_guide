import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/screens/quran_page_controller.dart';
import 'package:muslim_guide/screens/quran_page_screen.dart';

final _quranPageScreen = <QuranPageScreen>[];

/// list of quran pages to set it in [QuranPageController] to hold all quran
/// pages
List<QuranPageScreen> get quranPageScreen => _quranPageScreen;

Future<void> prepareQuranPagesList() async {
  final quranPages = await getQuranPages();
  final pagesContentList = quranPages.map((e) => QuranPageScreen(e)).toList();
  _quranPageScreen.addAll(pagesContentList);
}
