import 'package:json_annotation/json_annotation.dart';

part 'prayer_timings.g.dart';

@JsonSerializable()
class PrayerTimings {
  PrayerTimings({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
/*    this.sunset,
    this.imsak,
    this.midnight,*/
  });

  @JsonKey(name: 'Fajr')
  final String fajr;

  @JsonKey(name: 'Sunrise')
  final String sunrise;

  @JsonKey(name: 'Dhuhr')
  final String dhuhr;

  @JsonKey(name: 'Asr')
  final String asr;

  @JsonKey(name: 'Maghrib')
  final String maghrib;

  @JsonKey(name: 'Isha')
  final String isha;

  /*
  @JsonKey(name: 'Sunset')
  final String sunset;

  @JsonKey(name: 'Imsak')
  final String imsak;

  @JsonKey(name: 'Midnight')
  final String midnight;
  */

  factory PrayerTimings.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimingsFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimingsToJson(this);

  @override
  String toString() {
    return 'PrayerTimings{fajr: $fajr, sunrise: $sunrise, dhuhr: $dhuhr,'
        ' asr: $asr, maghrib: $maghrib, isha: $isha}';
  }
}
