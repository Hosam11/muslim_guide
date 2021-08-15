import 'dart:convert';

import 'package:muslim_guide/data/models/ayah/ayah.dart';
import 'package:json_annotation/json_annotation.dart';
// FIXME: m

// part 'quran_page.g.dart';

// List<OldQuranPage> quranDataFromJson(String str) => List<OldQuranPage>.from(
//     jsonDecode(str).map((x) => OldQuranPage.fromJson(x)));

@JsonSerializable()
class OldQuranPage {
  int pageNumber, juz, quarter, hizb;
  final String surahName;
  final List<Ayah> pageAyahs;

  OldQuranPage({
    this.pageNumber,
    this.juz,
    this.quarter,
    this.hizb,
    this.surahName,
    this.pageAyahs,
  });

  // factory OldQuranPage.fromJson(Map<String, dynamic> json) =>
  //     _$OldQuranPageFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$OldQuranPageToJson(this);
}
