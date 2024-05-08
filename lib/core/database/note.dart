import 'package:drift/drift.dart';
import 'package:game_notes/core/database/note_group.dart';


class Note extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text().withLength(max: 10000)();
  IntColumn get groupId => integer().nullable().references(NoteGroup, #id)();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}