import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Features/Home/Models/SmartClock.dart';
import '../Features/Home/Models/SmartGarage.dart';
import '../Features/Home/Models/SmartLamp.dart';
import '../Features/Home/Models/SmartMicrowave.dart';
import '../Features/Home/Models/SmartPlug.dart';
import '../Features/Home/Models/SmartRefrigerator.dart';
import '../Features/Home/Models/SmartSpeaker.dart';
import '../Features/Home/Models/SmartThermostat.dart';
import '../Features/Home/Models/SmartTv.dart';
import '../Features/Home/Models/SmartWasher.dart';

class DevicesDatabaseHelper {
  static final DevicesDatabaseHelper instance =
      DevicesDatabaseHelper._internal();
  static Database? _database;

  DevicesDatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'smart_devices.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE SmartClocks (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        volume REAL,
        alarmHour INTEGER,
        alarmMinute INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartGarages (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        isUp INTEGER,
        isDown INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartLamps (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        color TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartMicrowaves (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        temp INTEGER,
        time INTEGER,
        cookingMode INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartPlugs (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        usageKw REAL
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartSpeakers (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        volume REAL,
        isPlaying INTEGER,
        indexCurrentSong INTEGER,
        playlist TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartThermostats (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        temperature INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartTvs (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        volume REAL,
        tvMode INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE SmartWashers (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        temperature INTEGER,
        speedLevel INTEGER,
        soilLevel INTEGER,
        washingMode INTEGER
      )
    ''');
    await db.execute('''
      CREATE TABLE SmartRefrigerators (
        deviceId TEXT PRIMARY KEY,
        name TEXT,
        image TEXT,
        roomIndex INTEGER,
        isOn INTEGER,
        isDoorOpen INTEGER,
        fridgeTemp INTEGER,
        freezerTemp INTEGER,
        coolingMode INTEGER
  )
''');
  }

  // Smart Clock
  Future<void> insertSmartClock(Map<String, dynamic> smartClock) async {
    final db = await database;
    await db.insert('SmartClocks', smartClock,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartClocks() async {
    final db = await database;
    return await db.query('SmartClocks');
  }

  Future<void> updateSmartClocks(SmartClock smartClock) async {
    final db = await database;
    await db.update('SmartClocks', smartClock.toMap(),
        where: 'deviceId = ?', whereArgs: [smartClock.deviceId]);
  }

  Future<void> deleteSmartClock(String id) async {
    final db = await database;
    await db.delete('SmartClocks', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Garage
  Future<void> insertSmartGarage(Map<String, dynamic> smartGarage) async {
    final db = await database;
    await db.insert('SmartGarages', smartGarage,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartGarages() async {
    final db = await database;
    return await db.query('SmartGarages');
  }

  Future<void> updateSmartGarage(SmartGarage smartGarage) async {
    final db = await database;
    await db.update('SmartGarages', smartGarage.toMap(),
        where: 'deviceId = ?', whereArgs: [smartGarage.deviceId]);
  }

  Future<void> deleteSmartGarage(String id) async {
    final db = await database;
    await db.delete('SmartGarages', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Lamp
  Future<void> insertSmartLamp(Map<String, dynamic> smartLamp) async {
    final db = await database;
    await db.insert('SmartLamps', smartLamp,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartLamps() async {
    final db = await database;
    return await db.query('SmartLamps');
  }

  Future<void> updateSmartLamp(SmartLamp smartLamp) async {
    final db = await database;
    await db.update('SmartLamps', smartLamp.toMap(),
        where: 'deviceId = ?', whereArgs: [smartLamp.deviceId]);
  }

  Future<void> deleteSmartLamp(String id) async {
    final db = await database;
    await db.delete('SmartLamps', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Microwave
  Future<void> insertSmartMicrowave(Map<String, dynamic> smartMicrowave) async {
    final db = await database;
    await db.insert('SmartMicrowaves', smartMicrowave,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartMicrowaves() async {
    final db = await database;
    return await db.query('SmartMicrowaves');
  }

  Future<void> updateSmartMicrowave(SmartMicrowave smartMicrowave) async {
    final db = await database;
    await db.update('SmartMicrowaves', smartMicrowave.toMap(),
        where: 'deviceId = ?', whereArgs: [smartMicrowave.deviceId]);
  }

  Future<void> deleteSmartMicrowave(String id) async {
    final db = await database;
    await db.delete('SmartMicrowaves', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Plug
  Future<void> insertSmartPlug(Map<String, dynamic> smartPlug) async {
    final db = await database;
    await db.insert('SmartPlugs', smartPlug,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartPlugs() async {
    final db = await database;
    return await db.query('SmartPlugs');
  }

  Future<void> updateSmartPlug(SmartPlug smartPlug) async {
    final db = await database;
    await db.update('SmartPlugs', smartPlug.toMap(),
        where: 'deviceId = ?', whereArgs: [smartPlug.deviceId]);
  }

  Future<void> deleteSmartPlug(String id) async {
    final db = await database;
    await db.delete('SmartPlugs', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Speaker
  Future<void> insertSmartSpeaker(Map<String, dynamic> smartSpeaker) async {
    try {
      final db = await database;
      await db.insert('SmartSpeakers', smartSpeaker,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print("Error insertSmartSpeaker => " + e.toString());
      print("===>" + smartSpeaker.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getSmartSpeakers() async {
    try {
      final db = await database;
      return await db.query('SmartSpeakers');
    } catch (e) {
      print("Error getSmartSpeakers => " + e.toString());
    }
    return [];
  }

  Future<void> updateSmartSpeaker(SmartSpeaker smartSpeaker) async {
    final db = await database;
    await db.update('SmartSpeakers', smartSpeaker.toMap(),
        where: 'deviceId = ?', whereArgs: [smartSpeaker.deviceId]);
  }

  Future<void> deleteSmartSpeaker(String id) async {
    final db = await database;
    await db.delete('SmartSpeakers', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Thermostat
  Future<void> insertSmartThermostat(
      Map<String, dynamic> smartThermostat) async {
    final db = await database;
    await db.insert('SmartThermostats', smartThermostat,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartThermostats() async {
    final db = await database;
    return await db.query('SmartThermostats');
  }

  Future<void> updateSmartThermostat(SmartThermostat smartThermostat) async {
    final db = await database;
    await db.update('SmartThermostats', smartThermostat.toMap(),
        where: 'deviceId = ?', whereArgs: [smartThermostat.deviceId]);
  }

  Future<void> deleteSmartThermostat(String id) async {
    final db = await database;
    await db.delete('SmartThermostats', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Tv
  Future<void> insertSmartTv(Map<String, dynamic> smartTv) async {
    final db = await database;
    await db.insert('SmartTvs', smartTv,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartTvs() async {
    final db = await database;
    return await db.query('SmartTvs');
  }

  Future<void> updateSmartTv(SmartTv smartTv) async {
    final db = await database;
    await db.update('SmartTvs', smartTv.toMap(),
        where: 'deviceId = ?', whereArgs: [smartTv.deviceId]);
  }

  Future<void> deleteSmartTv(String id) async {
    final db = await database;
    await db.delete('SmartTvs', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Washer
  Future<void> insertSmartWasher(Map<String, dynamic> smartWasher) async {
    final db = await database;
    await db.insert('SmartWashers', smartWasher,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartWashers() async {
    final db = await database;
    return await db.query('SmartWashers');
  }

  Future<void> updateSmartWasher(SmartWasher smartWasher) async {
    final db = await database;
    await db.update('SmartWashers', smartWasher.toMap(),
        where: 'deviceId = ?', whereArgs: [smartWasher.deviceId]);
  }

  Future<void> deleteSmartWasher(String id) async {
    final db = await database;
    await db.delete('SmartWashers', where: 'deviceId = ?', whereArgs: [id]);
  }

  // Smart Refrigerator
  Future<void> insertSmartRefrigerator(
      Map<String, dynamic> smartRefrigerator) async {
    final db = await database;
    await db.insert('SmartRefrigerators', smartRefrigerator,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getSmartRefrigerators() async {
    final db = await database;
    return await db.query('SmartRefrigerators');
  }

  Future<void> updateSmartRefrigerator(
      SmartRefrigerator smartRefrigerator) async {
    final db = await database;
    await db.update('SmartRefrigerators', smartRefrigerator.toMap(),
        where: 'deviceId = ?', whereArgs: [smartRefrigerator.deviceId]);
  }

  Future<void> deleteSmartRefrigerator(String id) async {
    final db = await database;
    await db
        .delete('SmartRefrigerators', where: 'deviceId = ?', whereArgs: [id]);
  }
}
