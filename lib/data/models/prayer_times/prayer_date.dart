import 'package:json_annotation/json_annotation.dart';

part 'prayer_date.g.dart';

@JsonSerializable()
class PrayerDate {
  PrayerDate(this.timestamp);

  String timestamp;

  Map<String, dynamic> toJson() => _$PrayerDateToJson(this);

  factory PrayerDate.fromJson(Map<String, dynamic> json) =>
      _$PrayerDateFromJson(json);
}
