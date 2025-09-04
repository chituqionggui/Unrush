import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  Database? _db;

  Database get db {
    final d = _db;
    if (d == null) {
      throw StateError('Database not initialized. Call AppDatabase.instance.init() first.');
    }
    return d;
  }

  Future<void> init() async {
    if (_db != null) return;
    final databasesPath = await getDatabasesPath();
    final path = p.join(databasesPath, 'study_calm.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await _applySchemaV1(db);
        await db.execute('PRAGMA user_version = 1');
      },
      onOpen: (db) async {
        final ver = Sqflite.firstIntValue(await db.rawQuery('PRAGMA user_version')) ?? 0;
        if (ver == 0) {
          await db.execute('PRAGMA user_version = 1');
        }
      },
    );
  }

  Future<void> _applySchemaV1(Database db) async {
    final sql = await rootBundle.loadString('lib/data/schema_v1.sql');
    final statements = sql
        .split(';')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty && !s.startsWith('--'));
    for (final stmt in statements) {
      await db.execute(stmt);
    }
    await db.insert('settings', {
      'id': 1,
      'locale': 'zh',
      'pin_enabled': 0,
      'biometric_enabled': 0,
      'quiet_hours': null,
      'sensitive_mode': 0,
      'export_path': null,
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}

