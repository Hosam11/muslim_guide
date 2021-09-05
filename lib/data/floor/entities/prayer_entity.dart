import 'package:floor/floor.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_times_data.dart';

@entity
class PrayerEntity {
  PrayerEntity({
    required this.dayNumber,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.timestamp,
    required this.lat,
    required this.lng,
    required this.methodId,
    required this.methodName,
  });

  @PrimaryKey(autoGenerate: true)
  int? tableId;

  final int dayNumber;

  final String fajr;

  final String sunrise;

  final String dhuhr;

  final String asr;

  final String maghrib;

  final String isha;

  final String timestamp;

  final double lat;
  final double lng;

  final int methodId;
  final String methodName;

  @override
  String toString() {
    return 'PrayerEntity{tableId: $tableId, dayNumber: $dayNumber, fajr: $fajr, '
        'sunrise: $sunrise, dhuhr: $dhuhr, asr: $asr, maghrib: $maghrib,'
        ' isha: $isha, timestamp: $timestamp, lat: $lat, lng: $lng,'
        ' methodId: $methodId, methodName: $methodName}';
  }
}

PrayerEntity prayerEntityFromPrayerData({
  required PrayerTimesData data,
  required int dayNumber,
}) =>
    PrayerEntity(
      dayNumber: dayNumber,
      fajr: data.prayerTimes.fajr,
      sunrise: data.prayerTimes.sunrise,
      dhuhr: data.prayerTimes.dhuhr,
      asr: data.prayerTimes.asr,
      maghrib: data.prayerTimes.maghrib,
      isha: data.prayerTimes.isha,
      timestamp: data.prayerDate.timestamp,
      lat: data.prayerMeta.latitude,
      lng: data.prayerMeta.longitude,
      methodId: data.prayerMeta.prayerMethod.id,
      methodName: data.prayerMeta.prayerMethod.name,
    );
