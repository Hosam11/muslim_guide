import 'package:floor/floor.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';

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
}

PrayerEntity prayerEntityFromPrayerTimes(PrayerTimings timings, timestamp) =>
    PrayerEntity();
