import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'surah.g.dart';

enum RevelationType { meccan, median }

List<Surah> surahListFromJson(String str) =>
    List<Surah>.from(jsonDecode(str).map((x) => Surah.fromJson(x)));

@JsonSerializable()
class Surah {
  final int number;
  final String name;
  final int numberOfAyahs;
  final RevelationType revelationType;
  int surahPageNumber;

  Surah({
    required this.number,
    required this.name,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.surahPageNumber,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);

  Surah.clone(Surah surah)
      : this(
          number: surah.number,
          name: surah.name,
          numberOfAyahs: surah.numberOfAyahs,
          revelationType: surah.revelationType,
          surahPageNumber: surah.surahPageNumber,
        );

  @override
  String toString() {
    return 'Surah{number: $number, name: $name, numberOfAyahs: $numberOfAyahs,'
        ' revelationType: $revelationType, surahPageNumber: $surahPageNumber}';
  }
}
