import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const String DATABASE_NAME = "CinemaSchedulerDatabase.db";
  static const String MOVIE_DETAILS_TABLE_NAME = "movieDetails";
  static const int DATABASE_VERSION = 1;

  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  static Database _database;

  DatabaseManager._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();

    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DATABASE_NAME);

    return await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $MOVIE_DETAILS_TABLE_NAME (
        $Id INTEGER PRIMARY KEY AUTOINCREMENT,
        $details TEXT NOT NULL
      )
    ''');
  }
}
