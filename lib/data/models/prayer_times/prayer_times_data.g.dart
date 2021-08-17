// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_times_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrayerTimesData _$PrayerTimesDataFromJson(Map<String, dynamic> json) {
  return PrayerTimesData(
    PrayerTimings.fromJson(json['timings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrayerTimesDataToJson(PrayerTimesData instance) =>
    <String, dynamic>{
      'timings': instance.prayerTimes,
    };
