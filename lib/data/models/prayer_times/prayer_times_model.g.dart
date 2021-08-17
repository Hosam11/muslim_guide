// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesModel _$PrayerTimesModelFromJson(Map<String, dynamic> json) {
  return PrayerTimesModel(
    prayerDataList: (json['data'] as List<dynamic>?)
        ?.map((e) => PrayerTimesData.fromJson(e as Map<String, dynamic>))
        .toList(),
    code: json['code'] as int?,
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$PrayerTimesModelToJson(PrayerTimesModel instance) =>
    <String, dynamic>{
      'data': instance.prayerDataList,
      'code': instance.code,
      'status': instance.status,
    };
