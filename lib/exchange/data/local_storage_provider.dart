import 'package:injectable/injectable.dart';
import 'package:learning_flutter/exchange/data/models.dart';
import 'package:sqflite/sqflite.dart';

const _tableName = "currencies";
const _keyColumnName = "key";
const _nameColumnName = "name";
const _exchangeColumnName = "exchange";
const _timestampColumnName = "timestamp";

const _createTableQuery = "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, $_keyColumnName TEXT NOT NULL, $_nameColumnName TEXT NOT NULL, $_exchangeColumnName REAL NOT NULL, $_timestampColumnName INTEGER)";

@LazySingleton()
class LocalStorageProvider {
  final _databaseFuture = openDatabase(
    'exchange.db',
    version: 1,
    onCreate: (database, ver) async {
      await database.execute(_createTableQuery);
    }
  );

  void insert(int timestamp, Currency currency) async {
    final db = await _databaseFuture;
    await db.insert(_tableName, {
      _keyColumnName: currency.key,
      _nameColumnName: currency.name,
      _exchangeColumnName: currency.exchange,
      _timestampColumnName: timestamp
    });
  }

  Stream<Currency> getCurrencyByKey(String key) async* {
    final db = await _databaseFuture;
    final cursor = await db.queryCursor(
        _tableName,
      where: "key = ?",
      whereArgs: [key]
    );
    while(await cursor.moveNext()) {
      yield Currency.fromMap(cursor.current);
    }
  }



}