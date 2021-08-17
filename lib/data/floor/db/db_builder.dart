import 'package:fimber/fimber.dart';
import 'package:muslim_guide/data/floor/db/floor_db.dart';

const String dbName = 'muslim_guide_db.db';

FloorDB? _db;

Future<void> initializeDB() async {
  _db = await $FloorFloorDB.databaseBuilder(dbName).build();
  Fimber.i('_dbHash= ${_db.hashCode}');
}

FloorDB? getDatabase() => _db;
