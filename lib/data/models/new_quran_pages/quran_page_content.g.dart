// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPageContent _$QuranPageContentFromJson(Map<String, dynamic> json) {
  return QuranPageContent(
    header: json['header'] as String,
    ayah: json['ayah'] as String,
  );
}

Map<String, dynamic> _$QuranPageContentToJson(QuranPageContent instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('header', instance.header);
  writeNotNull('ayah', instance.ayah);
  return val;
}
