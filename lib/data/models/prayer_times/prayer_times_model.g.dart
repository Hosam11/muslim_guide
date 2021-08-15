// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesModel _$PrayerTimesModelFromJson(Map<String, dynamic> json) {
  return PrayerTimesModel(
    code: json['code'] as int,
    status: json['status'] as String,
    prayerTimings: json['timings'] == null
        ? null
        : PrayerTimings.fromJson(json['timings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrayerTimesModelToJson(PrayerTimesModel instance) =>
    <String, dynamic>{
      'timings': instance.prayerTimings,
      'code': instance.code,
      'status': instance.status,
    };
