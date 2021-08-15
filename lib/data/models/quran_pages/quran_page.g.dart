// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPage _$QuranPageFromJson(Map<String, dynamic> json) {
  return QuranPage(
    pageNumber: json['pageNumber'] as int?,
    juz: json['juz'] as int?,
    quarter: json['quarter'] as int?,
    hizb: json['hizb'] as int?,
    surahName: json['surahName'] as String?,
    quranPageContents: (json['quranPageContents'] as List<dynamic>?)
        ?.map((e) => QuranPageContent.fromJson(e as Map<String, dynamic>))
        .toList(),
    ayahContent: json['ayahContent'] == null
        ? null
        : AyahContent.fromJson(json['ayahContent'] as Map<String, dynamic>),
    sajdaType: _$enumDecodeNullable(_$SajdaTypeEnumMap, json['sajdaType']),
    sajdaIndex: json['sajdaIndex'] as int?,
  );
}

Map<String, dynamic> _$QuranPageToJson(QuranPage instance) {
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

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$SajdaTypeEnumMap = {
  SajdaType.normal: 'normal',
  SajdaType.custom: 'custom',
};
