import 'package:floor/floor.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';

@dao
abstract class PrayerDao {
  @insert
  Future<List<int>> insertPrayerTimes(
    List<PrayerTimings> prayerTimes,
  );

  @Query('SELECT * FROM PrayerTimings where dayNumber= :dayNumber')
  Future<PrayerTimings?> getPrayerTime(int dayNumber);

  @Query('DELETE FROM PrayerTimings')
  Future<void> deleteAllData();
}
