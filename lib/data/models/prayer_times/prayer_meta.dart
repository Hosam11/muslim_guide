import 'package:json_annotation/json_annotation.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_method.dart';

part 'prayer_meta.g.dart';

@JsonSerializable()
class PrayerMeta {
  PrayerMeta(this.latitude, this.longitude, this.prayerMethod);

  final double latitude;
  final double longitude;
  @JsonKey(name: 'method')
  final PrayerMethod prayerMethod;

  Map<String, dynamic> toJson() => _$PrayerMetaToJson(this);

  factory PrayerMeta.fromJson(Map<String, dynamic> json) =>
      _$PrayerMetaFromJson(json);
}
