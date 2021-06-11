import 'package:json_annotation/json_annotation.dart';

part 'ayah.g.dart';

@JsonSerializable()
class Ayah {
  final int ayahNumber, surahNumber;
  final String ayahText, surahName;

  Ayah({
    this.ayahNumber,
    this.ayahText,
    this.surahName,
    this.surahNumber,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
}
