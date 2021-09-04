import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/floor/dao/prayer_dao.dart';
import 'package:muslim_guide/data/floor/db/db_builder.dart';
import 'package:muslim_guide/data/floor/db/floor_db.dart';
import 'package:muslim_guide/data/floor/entities/prayer_entity.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';

class PrayerOperations {
  static late FloorDB _db;
  static late PrayerDao _prayerDao;

  PrayerOperations._privateConstructor() {
    _db = getDatabase()!;
    _prayerDao = _db.prayerDao;
    Fimber.i('_dbHash= ${_db.hashCode}');
  }

  static final PrayerOperations instance =
      PrayerOperations._privateConstructor();

  Future<List<int>> insertPrayerTimes(
    List<PrayerTimings> prayerTimes,
  ) async {
    // prayerEntityFromPrayerTimes(timings, timestamp)

    final x = prayerTimes
        .map((timings) => prayerEntityFromPrayerTimes(timings, ''))
        .toList(growable: false);

    Fimber.i('_dbHash=${_db.hashCode} ');
    return await _prayerDao.insertPrayerTimes(prayerTimes);
  }

  Future<PrayerTimings?> getPrayerTime(int dayNumber) async {
    Fimber.i('_dbHash=${_db.hashCode} ');
    return await _prayerDao.getPrayerTime(dayNumber);
  }

  Future<void> deleteAllData() async {
    Fimber.i('_dbHash=${_db.hashCode} ');
    return await _prayerDao.deleteAllData();
  }
}
