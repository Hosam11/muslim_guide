// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_ayah.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomAyah _$CustomAyahFromJson(Map<String, dynamic> json) {
  return CustomAyah(
    pageNumber: json['page_number'] as int,
    ayahContent: json['ayah_content'] == null
        ? null
        : AyahContent.fromJson(json['ayah_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CustomAyahToJson(CustomAyah instance) =>
    <String, dynamic>{
      'page_number': instance.pageNumber,
      'ayah_content': instance.ayahContent,
    };
