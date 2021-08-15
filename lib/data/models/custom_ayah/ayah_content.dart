import 'package:json_annotation/json_annotation.dart';

// part 'ayah_content.g.dart';

@JsonSerializable()
class AyahContent {
  String firstAyahs;
  String sajdaWords;
  String lastAyahs;

  AyahContent({
    this.firstAyahs,
    this.sajdaWords,
    this.lastAyahs,
  });

  // factory AyahContent.fromJson(Map<String, dynamic> json) =>
  //     _$AyahContentFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$AyahContentToJson(this);
}
