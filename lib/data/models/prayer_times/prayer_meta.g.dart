// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerMeta _$PrayerMetaFromJson(Map<String, dynamic> json) {
  return PrayerMeta(
    (json['latitude'] as num).toDouble(),
    (json['longitude'] as num).toDouble(),
    PrayerMethod.fromJson(json['method'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrayerMetaToJson(PrayerMeta instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'method': instance.prayerMethod,
    };
