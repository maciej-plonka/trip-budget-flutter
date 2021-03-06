// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TripDao? _tripDaoInstance;

  BudgetDao? _budgetDaoInstance;

  ShoppingItemDao? _shoppingItemDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Trip` (`id` INTEGER, `name` TEXT NOT NULL, `startDateTime` INTEGER NOT NULL, `endDateTime` INTEGER NOT NULL, `imageUrl` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Budget` (`id` INTEGER, `tripId` INTEGER NOT NULL, `amount` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ShoppingItem` (`id` INTEGER, `tripId` INTEGER NOT NULL, `amount` TEXT NOT NULL, `name` TEXT NOT NULL, `comment` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TripDao get tripDao {
    return _tripDaoInstance ??= _$TripDao(database, changeListener);
  }

  @override
  BudgetDao get budgetDao {
    return _budgetDaoInstance ??= _$BudgetDao(database, changeListener);
  }

  @override
  ShoppingItemDao get shoppingItemDao {
    return _shoppingItemDaoInstance ??=
        _$ShoppingItemDao(database, changeListener);
  }
}

class _$TripDao extends TripDao {
  _$TripDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _tripInsertionAdapter = InsertionAdapter(
            database,
            'Trip',
            (Trip item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'startDateTime': item.startDateTime,
                  'endDateTime': item.endDateTime,
                  'imageUrl': item.imageUrl
                }),
        _tripUpdateAdapter = UpdateAdapter(
            database,
            'Trip',
            ['id'],
            (Trip item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'startDateTime': item.startDateTime,
                  'endDateTime': item.endDateTime,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Trip> _tripInsertionAdapter;

  final UpdateAdapter<Trip> _tripUpdateAdapter;

  @override
  Future<List<Trip>> findAll() async {
    return _queryAdapter.queryList('SELECT * FROM Trip',
        mapper: (Map<String, Object?> row) => Trip(
            id: row['id'] as int?,
            name: row['name'] as String,
            startDateTime: row['startDateTime'] as int,
            endDateTime: row['endDateTime'] as int,
            imageUrl: row['imageUrl'] as String?));
  }

  @override
  Future<Trip?> findById(int tripId) async {
    return _queryAdapter.query('SELECT * FROM Trip where id = ?1',
        mapper: (Map<String, Object?> row) => Trip(
            id: row['id'] as int?,
            name: row['name'] as String,
            startDateTime: row['startDateTime'] as int,
            endDateTime: row['endDateTime'] as int,
            imageUrl: row['imageUrl'] as String?),
        arguments: [tripId]);
  }

  @override
  Future<void> removeById(int tripId) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM Trip where id = ?1', arguments: [tripId]);
  }

  @override
  Future<void> create(Trip trip) async {
    await _tripInsertionAdapter.insert(trip, OnConflictStrategy.fail);
  }

  @override
  Future<void> update(Trip trip) async {
    await _tripUpdateAdapter.update(trip, OnConflictStrategy.fail);
  }
}

class _$BudgetDao extends BudgetDao {
  _$BudgetDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _budgetInsertionAdapter = InsertionAdapter(
            database,
            'Budget',
            (Budget item) => <String, Object?>{
                  'id': item.id,
                  'tripId': item.tripId,
                  'amount': item.amount
                }),
        _budgetUpdateAdapter = UpdateAdapter(
            database,
            'Budget',
            ['id'],
            (Budget item) => <String, Object?>{
                  'id': item.id,
                  'tripId': item.tripId,
                  'amount': item.amount
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Budget> _budgetInsertionAdapter;

  final UpdateAdapter<Budget> _budgetUpdateAdapter;

  @override
  Future<Budget?> findById(int budgetId) async {
    return _queryAdapter.query('SELECT * FROM Budget where id = ?1',
        mapper: (Map<String, Object?> row) => Budget(
            id: row['id'] as int?,
            tripId: row['tripId'] as int,
            amount: row['amount'] as String),
        arguments: [budgetId]);
  }

  @override
  Future<Budget?> findByTripId(int tripId) async {
    return _queryAdapter.query('SELECT * FROM Budget where tripId = ?1',
        mapper: (Map<String, Object?> row) => Budget(
            id: row['id'] as int?,
            tripId: row['tripId'] as int,
            amount: row['amount'] as String),
        arguments: [tripId]);
  }

  @override
  Future<void> create(Budget budget) async {
    await _budgetInsertionAdapter.insert(budget, OnConflictStrategy.fail);
  }

  @override
  Future<void> update(Budget budget) async {
    await _budgetUpdateAdapter.update(budget, OnConflictStrategy.fail);
  }
}

class _$ShoppingItemDao extends ShoppingItemDao {
  _$ShoppingItemDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _shoppingItemInsertionAdapter = InsertionAdapter(
            database,
            'ShoppingItem',
            (ShoppingItem item) => <String, Object?>{
                  'id': item.id,
                  'tripId': item.tripId,
                  'amount': item.amount,
                  'name': item.name,
                  'comment': item.comment
                }),
        _shoppingItemUpdateAdapter = UpdateAdapter(
            database,
            'ShoppingItem',
            ['id'],
            (ShoppingItem item) => <String, Object?>{
                  'id': item.id,
                  'tripId': item.tripId,
                  'amount': item.amount,
                  'name': item.name,
                  'comment': item.comment
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ShoppingItem> _shoppingItemInsertionAdapter;

  final UpdateAdapter<ShoppingItem> _shoppingItemUpdateAdapter;

  @override
  Future<ShoppingItem?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM ShoppingItem WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ShoppingItem(
            id: row['id'] as int?,
            tripId: row['tripId'] as int,
            amount: row['amount'] as String,
            name: row['name'] as String,
            comment: row['comment'] as String),
        arguments: [id]);
  }

  @override
  Future<List<ShoppingItem>> findAllByTripId(int tripId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ShoppingItem WHERE tripId = ?1',
        mapper: (Map<String, Object?> row) => ShoppingItem(
            id: row['id'] as int?,
            tripId: row['tripId'] as int,
            amount: row['amount'] as String,
            name: row['name'] as String,
            comment: row['comment'] as String),
        arguments: [tripId]);
  }

  @override
  Future<void> create(ShoppingItem shoppingItem) async {
    await _shoppingItemInsertionAdapter.insert(
        shoppingItem, OnConflictStrategy.fail);
  }

  @override
  Future<void> update(ShoppingItem shoppingItem) async {
    await _shoppingItemUpdateAdapter.update(
        shoppingItem, OnConflictStrategy.fail);
  }
}
