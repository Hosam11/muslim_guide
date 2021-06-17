import 'dart:convert';

import 'package:fimber/fimber.dart';
import 'package:flutter/cupertino.dart';
import 'package:muslim_guide/constants/strings.dart';
import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:muslim_guide/data/repository/quran_repo.dart';
import 'package:muslim_guide/helpers/app_helper.dart';
import 'package:muslim_guide/helpers/arabic_numbers.dart';
import '';

enum QuranContentType { surahHeader, ayah }

class QuranHelper {
  QuranHelper._();

  static final QuranHelper instance = QuranHelper._();
  final QuranRepo _quranRepo = QuranRepo.instance;
}

String createHizbQuarter({@required int quarter, @required int hizb}) =>
    '$quarterLabel: $quarter - $hizbLabel: $hizb';

String createPageNumber(int pageNumber) => '$pageLabel: $pageNumber';
