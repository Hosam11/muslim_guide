import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'quran_page_content.g.dart';

List<QuranPageContent> quranPageContentFromJson(String str) =>
    List<QuranPageContent>.from(
        json.decode(str).map((x) => QuranPageContent.fromJson(x)));

String quranPageContentToJson(List<QuranPageContent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class QuranPageContent {
  QuranPageContent({
    this.header,
    this.ayah,
  });

  @JsonKey(includeIfNull: false)
  final String? header;

  @JsonKey(includeIfNull: false)
  final String? ayah;

  factory QuranPageContent.fromJson(Map<String, dynamic> json) =>
      _$QuranPageContentFromJson(json);

  Map<String, dynamic> toJson() => _$QuranPageContentToJson(this);
}
