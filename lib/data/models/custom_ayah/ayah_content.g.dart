// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahContent _$AyahContentFromJson(Map<String, dynamic> json) {
  return AyahContent(
    firstAyahs: json['firstAyahs'] as String,
    sajdaWords: json['sajdaWords'] as String,
    lastAyahs: json['lastAyahs'] as String,
  );
}

Map<String, dynamic> _$AyahContentToJson(AyahContent instance) =>
    <String, dynamic>{
      'firstAyahs': instance.firstAyahs,
      'sajdaWords': instance.sajdaWords,
      'lastAyahs': instance.lastAyahs,
    };
