// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPage _$QuranPageFromJson(Map<String, dynamic> json) {
  return QuranPage(
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

Map<String, dynamic> _$QuranPageToJson(QuranPage instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'juz': instance.juz,
      'quarter': instance.quarter,
      'hizb': instance.hizb,
      'surahName': instance.surahName,
      'pageAyahs': instance.pageAyahs,
    };
