import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'prayer_times_model.g.dart';

@JsonSerializable()
class PrayerTimesModel {
  @JsonKey(name: 'timings')
  final PrayerTimings prayerTimings;

  final int code;
  final String status;
  const PrayerTimesModel({this.code, this.status, this.prayerTimings});

  // factory PrayerTimesModel.fromJson(Map<String, dynamic> json) =>
  //     _$PrayerTimesModelFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$PrayerTimesModelToJson(this);
}
