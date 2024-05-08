import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:game_notes/core/database/note.dart';
import 'package:game_notes/core/database/note_group.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

part 'database.g.dart';

@DriftDatabase(tables: [NoteGroup, Note])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cacheBase = (await getTemporaryDirectory()).path;

    sqlite3.tempDirectory = cacheBase;

    return NativeDatabase.createInBackground(file);
  });
}