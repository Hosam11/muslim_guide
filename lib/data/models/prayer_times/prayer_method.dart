import 'package:json_annotation/json_annotation.dart';

part 'prayer_method.g.dart';

@JsonSerializable()
class PrayerMethod {
  PrayerMethod(this.id, this.name);

  final int id;
  final String name;
  Map<String, dynamic> toJson() => _$PrayerMethodToJson(this);

  factory PrayerMethod.fromJson(Map<String, dynamic> json) =>
      _$PrayerMethodFromJson(json);
}
