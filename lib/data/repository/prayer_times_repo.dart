import 'package:dio/dio.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_times_model.dart';
import 'package:muslim_guide/services/http_service.dart';

class PrayerTimesRepo extends _PrayerTimesRepository {
  PrayerTimesRepo._privateConstructor();

  static final PrayerTimesRepo instance = PrayerTimesRepo._privateConstructor();

  @override
  Future<PrayerTimesModel> getPrayerTimes(String url) async {
    final res = await getRequest(url: url);
    if (res is Response) {
      final prayerTimesModel = PrayerTimesModel.fromJson(
        res.data as Map<String, dynamic>,
      );
      return prayerTimesModel;
    } else {
      final prayerTimesModel = const PrayerTimesModel(status: 'there is error');
      return prayerTimesModel;
    }
  }
}

abstract class _PrayerTimesRepository {
  Future<PrayerTimesModel> getPrayerTimes(String url);
}
