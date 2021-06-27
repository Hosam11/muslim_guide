// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldQuranPage _$OldQuranPageFromJson(Map<String, dynamic> json) {
  return OldQuranPage(
    pageNumber: json['pageNumber'] as int,
    juz: json['juz'] as int,
    quarter: json['quarter'] as int,
    hizb: json['hizb'] as int,
    surahName: json['surahName'] as String,
    pageAyahs: (json['pageAyahs'] as List)
        ?.map(
            (e) => e == null ? null : Ayah.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OldQuranPageToJson(OldQuranPage instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'juz': instance.juz,
      'quarter': instance.quarter,
      'hizb': instance.hizb,
      'surahName': instance.surahName,
      'pageAyahs': instance.pageAyahs,
    };
