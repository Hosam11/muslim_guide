import 'package:muslim_guide/data/models/prayer_times/prayer_times_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'prayer_times_model.g.dart';

@JsonSerializable()
class PrayerTimesModel {
  @JsonKey(name: 'data')
  final List<PrayerTimesData>? prayerDataList;

  final int? code;
  final String? status;

  const PrayerTimesModel({
    this.prayerDataList,
    this.code,
    this.status,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) =>
      _$PrayerTimesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerTimesModelToJson(this);

  @override
  String toString() {
    return 'PrayerTimesModel{prayerDataList: $prayerDataList, code: $code, status: $status}';
  }
}
