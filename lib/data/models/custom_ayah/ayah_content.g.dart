// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AyahContent _$AyahContentFromJson(Map<String, dynamic> json) {
  return AyahContent(
    firstAyahs: json['first_ayahs'] as String,
    sajdaWords: json['sajda_words'] as String,
    lastAyahs: json['last_ayahs'] as String,
  );
}

Map<String, dynamic> _$AyahContentToJson(AyahContent instance) =>
    <String, dynamic>{
      'first_ayahs': instance.firstAyahs,
      'sajda_words': instance.sajdaWords,
      'last_ayahs': instance.lastAyahs,
    };
