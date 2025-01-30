import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Features/Planning/Models/Routine.dart';

class RoutineDatabaseHelper {
  static final RoutineDatabaseHelper instance =
      RoutineDatabaseHelper._internal();
  static Database? _database;

  RoutineDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'routine_database.db');
    return openDatabase(path, version: 2, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE routines(
        id TEXT PRIMARY KEY,
        isActive INTEGER,
        title TEXT,
        action TEXT,
        startRoutineType INTEGER NULL,
        startRoutineVoice TEXT NULL,
        startRoutineTime TEXT NULL,
        days TEXT
      )
    ''');
  }

  Future<int> insertRoutine(Routine routine) async {
    final db = await database;
    return await db.insert('routines', routine.toMap());
  }

  Future<List<Routine>> getRoutines() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('routines');
    return List.generate(maps.length, (i) {
      return Routine.fromMap(maps[i]);
    });
  }

  Future<int> updateRoutine(Routine routine) async {
    final db = await database;
    return await db.update('routines', routine.toMap(),
        where: 'id = ?', whereArgs: [routine.id]);
  }

  Future<int> deleteRoutine(String id) async {
    final db = await database;
    return await db.delete('routines', where: 'id = ?', whereArgs: [id]);
  }

  Future<Routine?> getRoutineById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(
      'routines',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return Routine.fromMap(result.first);
    } else {
      return null;
    }
  }
}
