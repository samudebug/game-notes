import 'package:game_notes/core/database/database.dart';

abstract class NotesRepository {
  Stream<List<NoteData>> getAllByGroup({required int groupId});
  Future<NoteData> create({required int groupId});
  Stream<NoteData> get({required int id});
  Future<NoteData?> getFirst({required int groupId});
  Future<NoteData> update({required int id,String? content});
  Future<void> delete({required int id});
}