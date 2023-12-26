import 'package:learning_flutter/exchange/data/models.dart';
import 'package:sqflite/sqflite.dart';

const _tableName = "currencies";
const _keyColumnName = "key";
const _nameColumnName = "name";
const _exchangeColumnName = "exchange";
const _timestampColumnName = "timestamp";

class LocalStorageProvider {
  final _databaseFuture = openDatabase(
    'exchange.db',
    version: 1,
    onCreate: (database, ver) async {
      await database.execute(
        """
        CREATE TABLE $_tableName (
             key TEXT PRIMARY KEY,
             name TEXT NOT NULL,
             exchange REAL NOT NULL
             timestamp INTEGER
             )
        """
      );
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

}