import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/models/safekeeper.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    const dbName = 'lock_it.db';
    final path = join(dbPath, dbName);

    _database = await openDatabase(path, version: 1, onCreate: _createDB);

    return _database!;
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE password(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        userId TEXT,
        password TEXT,
        isFavorite INTEGER,
        lastUpdate TEXT,
        note TEXT,
        type INTEGER
      )
    ''');
  }

  Future<void> insertPassword(PasswordData password) async {
    final db = await database;
    password.password = SafeKeeper.encrypt(password.password);
    await db.insert(
      'password',
      password.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
    debugPrint('Data Inserted into LocalDB');
    db.close();
  }

  Future<void> deletePassword(PasswordData password) async {
    final db = await database;

    await db.delete(
      'password',
      where: 'id == ?',
      whereArgs: [password.id],
    );

    db.close();

    debugPrint('Data Deleted into LocalDB');
  }

  Future<void> updatePassword(PasswordData password) async {
    final db = await database;
    password.password = SafeKeeper.encrypt(password.password);

    await db.update(
      'password',
      {
        'title': password.title,
        'userId': password.userId,
        'password': password.password,
        'isFavorite': password.isFavorite ? 1 : 0,
        'lastUpdate': password.lastUpdate,
        'note': password.note,
        'type': password.type,
      },
      where: 'id == ?',
      whereArgs: [password.id],
    );

    db.close();

    debugPrint('Data Updated into LocalDB');
  }

  Future<List<PasswordData>> getPasswords() async {
    final db = await database;

    List<Map<String, dynamic>> items = await db.query(
      'password',
      orderBy: 'id DESC',
    );

    db.close();
    debugPrint('Data Readed Form LocalDB');
    return List.generate(
      items.length,
      (index) {
        var password = PasswordData.fromMap(items[index]);
        password.password = SafeKeeper.decrypt(password.password);
        return password;
      },
    );
  }
}
