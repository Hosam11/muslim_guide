import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:muslim_guide/data/models/quran_pages/quran_page_content.dart';

part 'quran_page.g.dart';

List<QuranPage> quranDataFromJson(String str) =>
    List<QuranPage>.from(jsonDecode(str).map((x) => QuranPage.fromJson(x)));

enum SajdaType { normal, custom }

@JsonSerializable()
class QuranPage {
  @JsonKey(includeIfNull: false)
  int pageNumber, juz, quarter, hizb, sajdaIndex;
  final String surahName;
  @JsonKey(includeIfNull: false)
  final List<QuranPageContent> quranPageContents;
  @JsonKey(includeIfNull: false)
  final AyahContent ayahContent;
  final SajdaType sajdaType;

  QuranPage({
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

  factory QuranPage.fromJson(Map<String, dynamic> json) =>
      _$NewQuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$NewQuranPageToJson(this);
}
