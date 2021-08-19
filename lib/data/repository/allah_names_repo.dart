import 'package:flutter/services.dart';
import 'package:muslim_guide/constants/assets.dart';
import 'package:muslim_guide/data/models/allah_names/allah_names.dart';

Future<List<AllahName>> getAllahNames() async {
  final allahNamesStr = await rootBundle.loadString(allahNamesFile);
  return allahNamesListFromJson(allahNamesStr);
}
