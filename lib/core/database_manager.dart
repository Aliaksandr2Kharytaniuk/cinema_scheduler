import 'package:cinema_scheduler/core/dependences.dart';
import 'package:cinema_scheduler/core/json_serializable_converter.dart';
import 'package:cinema_scheduler/data/models/details/details_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseManager {
  static const String DATABASE_NAME = "CinemaSchedulerDatabase.db";
  static const String MOVIE_DETAILS_TABLE_NAME = "movieDetailsTable";
  static const int DATABASE_VERSION = 1;

  static Database _database;
  static final DatabaseManager instance = DatabaseManager._privateConstructor();

  DatabaseManager._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();

    return _database;
  }

  Future<int> insert(DetailsData model) async {
    var db = await database;
    var jsonModel = model.toJson();
    var jsonModel2 = <String, dynamic>{
      "id": jsonModel["id"],
      "plotSummary": jsonModel["plotSummary"],
    };

    return await db.insert(MOVIE_DETAILS_TABLE_NAME, jsonModel2,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<DetailsData> query(String id) async {
    var db = await database;
    var maps = await db
        .query(MOVIE_DETAILS_TABLE_NAME, where: 'id = ?', whereArgs: [id]);

    if (maps.length > 0) {
      return DetailsData.fromJson(maps.first);
    }

    return null;
  }

  dynamic _initDatabase() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, DATABASE_NAME);

    return await openDatabase(path,
        version: DATABASE_VERSION, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $MOVIE_DETAILS_TABLE_NAME (
        _id INTEGER PRIMARY KEY AUTOINCREMENT,
        id TEXT,
        plotSummary TEXT
      )
    ''');
  }
}
