import 'package:drift/drift.dart';

class GameCache extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get gameId => integer()();
  TextColumn get name => text()();
  TextColumn get coverUrl => text()();
}