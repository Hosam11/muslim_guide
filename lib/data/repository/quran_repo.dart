import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page.dart';
import 'package:muslim_guide/helpers/app_helper.dart';

Future<List<QuranPage>> getQuranPages() async {
  // solved

  var h = '@@ AppRepo @@ getQuranPages() >>';
  final quranPagesRes = await rootBundle.loadString(newQuranPagesFile);
  final quranData = quranDataFromJson(quranPagesRes);
  mLog('$h quranData= ${jsonEncode(quranData)}');
  final methodName = StackFrame.fromStackTrace(StackTrace.current)[0].method;
  Fimber.i('methodName= $methodName  ');
  return quranData;
}
