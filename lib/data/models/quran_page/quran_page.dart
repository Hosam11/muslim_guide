import 'dart:convert';

import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quran_page.g.dart';

List<QuranPage> quranDataFromJson(String str) =>
    List<QuranPage>.from(jsonDecode(str).map((x) => QuranPage.fromJson(x)));

@JsonSerializable()
class QuranPage {
  int pageNumber, juz, quarter, hizb;
  final String surahName;
  final List<Ayah> pageAyahs;

  QuranPage({
    this.pageNumber,
    this.juz,
    this.quarter,
    this.hizb,
    this.surahName,
    this.pageAyahs,
  });

  factory QuranPage.fromJson(Map<String, dynamic> json) =>
      _$QuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageToJson(this);
}
