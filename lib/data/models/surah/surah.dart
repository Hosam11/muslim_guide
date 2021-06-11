import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/not_use/model/quran_me.dart';

part 'surah.g.dart';

// enum RevelationType { meccan, median }

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
    this.number,
    this.name,
    this.numberOfAyahs,
    this.revelationType,
    this.surahPageNumber,
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
}
