import 'package:floor/floor.dart';
import 'package:muslim_guide/data/floor/entities/prayer_entity.dart';

@dao
abstract class PrayerDao {
  @insert
  Future<List<int>> insertPrayerTimes(List<PrayerEntity> prayerEntities);

  @Query('SELECT * FROM PrayerEntity where dayNumber= :dayNumber')
  Future<PrayerEntity?> getPrayerEntity(int dayNumber);

  @Query('DELETE FROM PrayerEntity')
  Future<void> deleteAllData();
}
