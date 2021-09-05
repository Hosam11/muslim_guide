import 'dart:async';

import 'package:floor/floor.dart';
import 'package:muslim_guide/data/floor/dao/prayer_dao.dart';
import 'package:muslim_guide/data/floor/entities/prayer_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'floor_db.g.dart'; // the generated code will be there

@Database(version: 1, entities: [PrayerEntity])
abstract class FloorDB extends FloorDatabase {
  PrayerDao get prayerDao;
}
