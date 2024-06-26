import 'package:drift/drift.dart';
import 'package:game_notes/core/database/note.dart';


enum Status {
  playing,
  completed,
  dropped
}

class NoteGroup extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get gameId => text().nullable()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get status => textEnum<Status>()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

class NoteGroupWithNotes {
  final NoteGroup group;
  final List<Note> notes;

  NoteGroupWithNotes(this.group, this.notes);
}