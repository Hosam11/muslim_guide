// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewQuranPage _$NewQuranPageFromJson(Map<String, dynamic> json) {
  return NewQuranPage(
    pageNumber: json['pageNumber'] as int,
    juz: json['juz'] as int,
    quarter: json['quarter'] as int,
    hizb: json['hizb'] as int,
    surahName: json['surahName'] as String,
    quranPageContents: (json['quranPageContents'] as List)
        ?.map((e) => e == null
            ? null
            : QuranPageContent.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NewQuranPageToJson(NewQuranPage instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'juz': instance.juz,
      'quarter': instance.quarter,
      'hizb': instance.hizb,
      'surahName': instance.surahName,
      'quranPageContents': instance.quranPageContents,
    };
