import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/helpers/app/app_helper.dart';

Future<List<QuranPage>> getQuranPages() async {
  var h = '@@ AppRepo @@ getQuranPages() >>';
  final quranPagesRes = await rootBundle.loadString(updatedQuranPages);
  final quranData = quranDataFromJson(quranPagesRes);
  mLog('$h quranData= ${jsonEncode(quranData)}');
  return quranData;
}
