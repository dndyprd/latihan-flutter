import 'package:latihan_flutter/models/profile.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profiles.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE tb_profiles (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            profesi64 TEXT,
            nomorTelpon64 TEXT,
            domisili64 TEXT
          )
        ''');
      },
    );
  }

  static Future<List<Profile>> getProfiles() async {
    final db = await database;
    final data = await db.query('tb_profiles');
    return data.map((item) => Profile.fromMap(item)).toList();
  }

  static Future<int> insertProfile(Profile profile) async {
    final db = await database;
    return await db.insert('tb_profiles', profile.toMap());
  }

  static Future<int> updateProfile(Profile profile) async {
    final db = await database;
    return await db.update(
      'tb_profiles',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  static Future<int> deleteProfile(int id) async {
    final db = await database;
    return await db.delete('profiles', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }
}
