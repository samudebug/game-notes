import 'package:drift/drift.dart';
import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/database/note_group.dart';
import 'package:game_notes/core/repo/note_group/note_group_repository.dart';

class NoteGroupRepositoryDrift implements NoteGroupRepository {
  NoteGroupRepositoryDrift({required this.database});
  AppDatabase database;
  @override
  Future<NoteGroupData> create() async {
    return await database.into(database.noteGroup).insertReturning(
        NoteGroupCompanion.insert(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
            status: Status.playing,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now()));
  }

  @override
  Future<void> delete({required int id}) async {
    await (database.delete(database.noteGroup)
          ..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Stream<NoteGroupData> get({required int id}) {
    return (database.select(database.noteGroup)
          ..where((tbl) => tbl.id.equals(id)))
        .watchSingle();
  }

  @override
  Stream<List<NoteGroupData>> getAll() {
    return (database.select(database.noteGroup)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .watch();
  }

  @override
  Future<NoteGroupData> update(
      {required int id,
      DateTime? startDate,
      DateTime? endDate,
      Status status = Status.playing,
      String? gameId}) async {
    return (await (database.update(database.noteGroup)
              ..where((tbl) => tbl.id.equals(id)))
            .writeReturning(NoteGroupCompanion(
                startDate: Value.absentIfNull(startDate),
                endDate: Value.absentIfNull(endDate),
                status: Value.absentIfNull(status),
                gameId: Value.absentIfNull(gameId),
                updatedAt: Value(DateTime.now()))))
        .first;
  }
}
