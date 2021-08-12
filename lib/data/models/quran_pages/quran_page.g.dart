// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPage _$NewQuranPageFromJson(Map<String, dynamic> json) {
  return QuranPage(
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
    ayahContent: json['ayahContent'] == null
        ? null
        : AyahContent.fromJson(json['ayahContent'] as Map<String, dynamic>),
    sajdaType: _$enumDecodeNullable(_$SajdaTypeEnumMap, json['sajdaType']),
    sajdaIndex: json['sajdaIndex'] as int,
  );
}

Map<String, dynamic> _$NewQuranPageToJson(QuranPage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('pageNumber', instance.pageNumber);
  writeNotNull('juz', instance.juz);
  writeNotNull('quarter', instance.quarter);
  writeNotNull('hizb', instance.hizb);
  writeNotNull('sajdaIndex', instance.sajdaIndex);
  val['surahName'] = instance.surahName;
  writeNotNull('quranPageContents', instance.quranPageContents);
  writeNotNull('ayahContent', instance.ayahContent);
  val['sajdaType'] = _$SajdaTypeEnumMap[instance.sajdaType];
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SajdaTypeEnumMap = {
  SajdaType.normal: 'normal',
  SajdaType.custom: 'custom',
};
