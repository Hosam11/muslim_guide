import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/data/models/new_quran_pages/quran_page_content.dart';

part 'new_quran_page.g.dart';

List<NewQuranPage> quranDataFromJson(String str) => List<NewQuranPage>.from(
    jsonDecode(str).map((x) => NewQuranPage.fromJson(x)));

@JsonSerializable()
class NewQuranPage {
  int pageNumber, juz, quarter, hizb;
  final String surahName;
  final List<QuranPageContent> quranPageContents;

  NewQuranPage({
    this.pageNumber,
    this.juz,
    this.quarter,
    this.hizb,
    this.surahName,
    this.quranPageContents,
  });

  factory NewQuranPage.fromJson(Map<String, dynamic> json) =>
      _$NewQuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$NewQuranPageToJson(this);
}
