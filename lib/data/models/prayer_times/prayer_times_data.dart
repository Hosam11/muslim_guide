import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_date.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_meta.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';

part 'prayer_times_data.g.dart';

@JsonSerializable()
class PrayerTimesData {
  PrayerTimesData(this.prayerTimes, this.prayerDate, this.prayerMeta);

  @JsonKey(name: 'timings')
  final PrayerTimings prayerTimes;

  @JsonKey(name: 'date')
  final PrayerDate prayerDate;

  @JsonKey(name: 'meta')
  final PrayerMeta prayerMeta;

  Map<String, dynamic> toJson() => _$PrayerTimesDataToJson(this);

  factory PrayerTimesData.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesDataFromJson(json);

  @override
  String toString() {
    return 'PrayerTimesData{prayerTimes: $prayerTimes}';
  }
}
