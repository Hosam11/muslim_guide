// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'azkar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Azkar _$AzkarFromJson(Map<String, dynamic> json) {
  return Azkar(
    category: json['category'] as String?,
    count: json['count'] as String?,
    description: json['description'] as String?,
    reference: json['reference'] as String?,
    zekr: json['zekr'] as String?,
  );
}

Map<String, dynamic> _$AzkarToJson(Azkar instance) => <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'description': instance.description,
      'reference': instance.reference,
      'zekr': instance.zekr,
    };
