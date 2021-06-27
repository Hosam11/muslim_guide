import 'dart:convert';

import 'package:muslim_guide/data/models/custom_ayah/ayah_content.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_ayah.g.dart';

List<CustomAyah> customAyahFromJson(String str) =>
    List<CustomAyah>.from(json.decode(str).map((x) => CustomAyah.fromJson(x)));

@JsonSerializable()
class CustomAyah {
  @JsonKey(name: 'page_number')
  int pageNumber;
  @JsonKey(name: 'ayah_content')
  AyahContent ayahContent;

  CustomAyah({
    this.pageNumber,
    this.ayahContent,
  });

  factory CustomAyah.fromJson(Map<String, dynamic> json) =>
      _$CustomAyahFromJson(json);

  Map<String, dynamic> toJson() => _$CustomAyahToJson(this);
}
