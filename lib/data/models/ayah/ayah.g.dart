// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ayah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ayah _$AyahFromJson(Map<String, dynamic> json) {
  return Ayah(
    ayahNumber: json['ayahNumber'] as int?,
    ayahText: json['ayahText'] as String?,
    surahName: json['surahName'] as String?,
    surahNumber: json['surahNumber'] as int?,
  );
}

Map<String, dynamic> _$AyahToJson(Ayah instance) => <String, dynamic>{
      'ayahNumber': instance.ayahNumber,
      'surahNumber': instance.surahNumber,
      'ayahText': instance.ayahText,
      'surahName': instance.surahName,
    };
