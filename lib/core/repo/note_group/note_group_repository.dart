import 'package:game_notes/core/database/database.dart';
import 'package:game_notes/core/database/note_group.dart';

abstract class NoteGroupRepository {
  Stream<List<NoteGroupData>> getAll();
  Stream<NoteGroupData> get({required int id});
  Future<NoteGroupData> create();
  Future<NoteGroupData> update({required int id,DateTime? startDate, DateTime? endDate, Status status = Status.playing, String? gameId});
  Future<void> delete({required int id});
}