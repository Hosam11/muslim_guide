// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorFloorDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorDBBuilder databaseBuilder(String name) =>
      _$FloorDBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorDBBuilder inMemoryDatabaseBuilder() => _$FloorDBBuilder(null);
}

class _$FloorDBBuilder {
  _$FloorDBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorDBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorDBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorDB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorDB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorDB extends FloorDB {
  _$FloorDB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PrayerDao? _prayerDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PrayerTimings` (`fajr` TEXT, `sunrise` TEXT, `dhuhr` TEXT, `asr` TEXT, `maghrib` TEXT, `isha` TEXT, `tableId` INTEGER PRIMARY KEY AUTOINCREMENT, `dayNumber` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PrayerDao get prayerDao {
    return _prayerDaoInstance ??= _$PrayerDao(database, changeListener);
  }
}

class _$PrayerDao extends PrayerDao {
  _$PrayerDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _prayerTimingsInsertionAdapter = InsertionAdapter(
            database,
            'PrayerTimings',
            (PrayerTimings item) => <String, Object?>{
                  'fajr': item.fajr,
                  'sunrise': item.sunrise,
                  'dhuhr': item.dhuhr,
                  'asr': item.asr,
                  'maghrib': item.maghrib,
                  'isha': item.isha,
                  'tableId': item.tableId,
                  'dayNumber': item.dayNumber
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PrayerTimings> _prayerTimingsInsertionAdapter;

  @override
  Future<PrayerTimings?> getPrayerTime(int dayNumber) async {
    return _queryAdapter.query(
        'SELECT * FROM PrayerTimings where dayNumber= ?1',
        mapper: (Map<String, Object?> row) => PrayerTimings(
            dayNumber: row['dayNumber'] as int?,
            fajr: row['fajr'] as String?,
            sunrise: row['sunrise'] as String?,
            dhuhr: row['dhuhr'] as String?,
            asr: row['asr'] as String?,
            maghrib: row['maghrib'] as String?,
            isha: row['isha'] as String?),
        arguments: [dayNumber]);
  }

  @override
  Future<void> deleteAllData() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PrayerTimings');
  }

  @override
  Future<List<int>> insertPrayerTimes(List<PrayerTimings> prayerTimes) {
    return _prayerTimingsInsertionAdapter.insertListAndReturnIds(
        prayerTimes, OnConflictStrategy.abort);
  }
}
