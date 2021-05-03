import 'dart:convert' as convert;
import 'package:flutter/services.dart';
import 'package:muslim_guide/util.dart';

class QuranRepo {
  QuranRepo._privateConstructor();
  static final QuranRepo instance = QuranRepo._privateConstructor();

  List<dynamic> quranPages;

  Future<void> getPages() async {
    final pagesRes =
        await rootBundle.loadString('assets/files/quran_pages.json');
    /*
     pagesList is NOT analysis_options.yaml string it's List<dynamic> "List of [QuranPage]"
     to access element in it you can type pagesList[0]['pageNumber']
     */
    final List<dynamic> pagesList =
        await convert.jsonDecode(pagesRes) as List<dynamic>;

    QuranRepo.instance.quranPages = pagesList;

    // print('pagesList=  $pagesList');
    // print('pagesList[0]=  ${pagesList[0]['ayahNumberMap']}');
  }

  String getQuranPage(int page) {
    if (quranPages != null) {
      final Map<String, dynamic> ayahTexMap =
          quranPages[page - 1]['ayahNumberMap'] as Map<String, dynamic>;
      // print('ayahTexMap= $ayahTexMap');

      final List<String> ayahs = [];

      ayahTexMap.forEach((ayahNumber, ayahText) {
        ayahs.add(
            '$ayahText\uFD3F${Util.arabicNumber.convert(ayahNumber)}\uFD3E');
      });
      final String pageString = ayahs.join();
      print('pageString= $pageString');
      return pageString;
    } else {
      return '';
    }
  }

  void displayAyahs() {}
}
