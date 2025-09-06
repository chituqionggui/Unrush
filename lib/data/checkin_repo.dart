import 'dart:convert';
import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

import 'db.dart';

class CheckinRepo {
  Database get _db => AppDatabase.instance.db;

  Future<int> insertQuickCheckin({
    required String moodTag,
    required int intensity, // 0..10
    List<String>? contextTags,
    List<int>? noteCipher, // optional encrypted bytes (GCM)
    int riskScore = 0,
    Map<String, dynamic>? flags,
    DateTime? ts,
  }) async {
    final now = ts ?? DateTime.now();
    return _db.insert('checkins', {
      'ts': now.millisecondsSinceEpoch,
      'mood_tag': moodTag,
      'intensity': intensity,
      'context_tags': contextTags == null ? null : jsonEncode(contextTags),
      'note_cipher': noteCipher == null ? null : Uint8List.fromList(noteCipher),
      'risk_score': riskScore,
      'flags': flags == null ? null : jsonEncode(flags),
    });
  }

  Future<List<Map<String, Object?>>> getRecentCheckins({int limit = 20}) async {
    return _db.query(
      'checkins',
      orderBy: 'ts DESC',
      limit: limit,
    );
  }
}
