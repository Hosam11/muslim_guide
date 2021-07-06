import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:muslim_guide/data/models/new_quran_pages/quran_page_content.dart';

part 'new_quran_page.g.dart';

List<NewQuranPage> quranDataFromJson(String str) => List<NewQuranPage>.from(
    jsonDecode(str).map((x) => NewQuranPage.fromJson(x)));

enum SajdaType { normal, custom }

@JsonSerializable()
class NewQuranPage {
  @JsonKey(includeIfNull: false)
  int pageNumber, juz, quarter, hizb, sajdaIndex;
  final String surahName;
  @JsonKey(includeIfNull: false)
  final List<QuranPageContent> quranPageContents;
  @JsonKey(includeIfNull: false)
  final AyahContent ayahContent;
  final SajdaType sajdaType;

  NewQuranPage({
    this.pageNumber,
    this.juz,
    this.quarter,
    this.hizb,
    this.surahName,
    this.quranPageContents,
    this.ayahContent,
    this.sajdaType,
    this.sajdaIndex,
  });

  factory NewQuranPage.fromJson(Map<String, dynamic> json) =>
      _$NewQuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$NewQuranPageToJson(this);
}
