import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';

part 'prayer_times_data.g.dart';

@JsonSerializable()
class PrayerTimesData {
  PrayerTimesData(this.prayerTimes);

  @JsonKey(name: 'timings')
  final PrayerTimings prayerTimes;

  Map<String, dynamic> toJson() => _$PrayerTimesDataToJson(this);

  factory PrayerTimesData.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesDataFromJson(json);

  @override
  String toString() {
    return 'PrayerTimesData{prayerTimes: $prayerTimes}';
  }
}
