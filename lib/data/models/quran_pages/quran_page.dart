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
  int? pageNumber, juz, quarter, hizb, sajdaIndex;
  final String? surahName;
  @JsonKey(includeIfNull: false)
  final List<QuranPageContent>? quranPageContents;
  @JsonKey(includeIfNull: false)
  AyahContent? ayahContent;
  SajdaType? sajdaType;

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
      _$QuranPageFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageToJson(this);

  @override
  String toString() {
    return 'QuranPage{pageNumber: $pageNumber, juz: $juz, quarter: $quarter, '
        'hizb: $hizb, sajdaIndex: $sajdaIndex, surahName: $surahName,'
        ' quranPageContents: $quranPageContents, ayahContent: $ayahContent,'
        ' sajdaType: $sajdaType}';
  }
}
