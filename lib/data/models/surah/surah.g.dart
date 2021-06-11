// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Surah _$SurahFromJson(Map<String, dynamic> json) {
  return Surah(
    number: json['number'] as int,
    name: json['name'] as String,
    numberOfAyahs: json['numberOfAyahs'] as int,
    revelationType:
        _$enumDecodeNullable(_$RevelationTypeEnumMap, json['revelationType']),
    surahPageNumber: json['surahPageNumber'] as int,
  );
}

Map<String, dynamic> _$SurahToJson(Surah instance) => <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'numberOfAyahs': instance.numberOfAyahs,
      'revelationType': _$RevelationTypeEnumMap[instance.revelationType],
      'surahPageNumber': instance.surahPageNumber,
    };

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

const _$RevelationTypeEnumMap = {
  RevelationType.meccan: 'meccan',
  RevelationType.median: 'median',
};
