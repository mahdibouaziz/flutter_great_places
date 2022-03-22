import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DBHelper {
  static Future<sql.Database> database() async {
    // get the database path (inside you app main folder)
    final dbPath = await sql.getDatabasesPath();
    // open a database or create one if it doesn't exists
    return await sql.openDatabase(path.join(dbPath, 'places.db'),
        onCreate: (db, version) {
      // run a sql query
      return db.execute(
        'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)',
      );
    }, version: 1);
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final sqlDB = await DBHelper.database();

    // insert our data
    sqlDB.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final sqlDB = await DBHelper.database();
    return sqlDB.query(table);
  }
}
