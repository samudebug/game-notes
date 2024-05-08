import 'package:drift/drift.dart';
import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/repo/notes/notes_repository.dart';

class NotesRepositoryDrift implements NotesRepository {
  NotesRepositoryDrift({required this.database});
  final AppDatabase database;
  @override
  Future<NoteData> create({required int groupId}) async {
    await (database.update(database.noteGroup)
          ..where((tbl) => tbl.id.equals(groupId)))
        .write(NoteGroupCompanion(updatedAt: Value(DateTime.now())));
    return await database.into(database.note).insertReturning(
        NoteCompanion.insert(
            content: "",
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            groupId: Value.absentIfNull(groupId)));
  }

  @override
  Future<void> delete({required int id}) async {
    await (database.delete(database.note)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Stream<NoteData> get({required int id}) {
    return (database.select(database.note)..where((tbl) => tbl.id.equals(id)))
        .watchSingle();
  }

  @override
  Future<NoteData> update({required int id, String? content}) async {
    return (await (database.update(database.note)
              ..where((tbl) => tbl.id.equals(id)))
            .writeReturning(NoteCompanion(
                updatedAt: Value(DateTime.now()),
                content: Value.absentIfNull(content))))
        .first;
  }

  @override
  Stream<List<NoteData>> getAllByGroup({required int groupId}) {
    return (database.select(database.note)
          ..where((tbl) => tbl.groupId.equals(groupId))
          ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
        .watch();
  }

  @override
  Future<NoteData?> getFirst({required int groupId}) async {
    return (await (database.select(database.note)
              ..where((tbl) => tbl.groupId.equals(groupId))
              ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
            .get())
        .firstOrNull;
  }
}
