import 'dart:async';

import 'package:floor/floor.dart';
import 'package:muslim_guide/data/floor/dao/prayer_dao.dart';
import 'package:muslim_guide/data/models/prayer_times/prayer_timings.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_db.g.dart'; // the generated code will be there

@Database(version: 1, entities: [PrayerTimings])
abstract class FloorDB extends FloorDatabase {
  PrayerDao get prayerDao;
}
