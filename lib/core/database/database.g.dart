// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NoteGroupTable extends NoteGroup
    with TableInfo<$NoteGroupTable, NoteGroupData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteGroupTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<String> gameId = GeneratedColumn<String>(
      'game_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumnWithTypeConverter<Status, String> status =
      GeneratedColumn<String>('status', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Status>($NoteGroupTable.$converterstatus);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, gameId, startDate, endDate, status, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_group';
  @override
  VerificationContext validateIntegrity(Insertable<NoteGroupData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteGroupData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteGroupData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}game_id']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      status: $NoteGroupTable.$converterstatus.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NoteGroupTable createAlias(String alias) {
    return $NoteGroupTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Status, String, String> $converterstatus =
      const EnumNameConverter<Status>(Status.values);
}

class NoteGroupData extends DataClass implements Insertable<NoteGroupData> {
  final int id;
  final String? gameId;
  final DateTime startDate;
  final DateTime endDate;
  final Status status;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NoteGroupData(
      {required this.id,
      this.gameId,
      required this.startDate,
      required this.endDate,
      required this.status,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || gameId != null) {
      map['game_id'] = Variable<String>(gameId);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    {
      map['status'] =
          Variable<String>($NoteGroupTable.$converterstatus.toSql(status));
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NoteGroupCompanion toCompanion(bool nullToAbsent) {
    return NoteGroupCompanion(
      id: Value(id),
      gameId:
          gameId == null && nullToAbsent ? const Value.absent() : Value(gameId),
      startDate: Value(startDate),
      endDate: Value(endDate),
      status: Value(status),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NoteGroupData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteGroupData(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<String?>(json['gameId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      status: $NoteGroupTable.$converterstatus
          .fromJson(serializer.fromJson<String>(json['status'])),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<String?>(gameId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'status': serializer
          .toJson<String>($NoteGroupTable.$converterstatus.toJson(status)),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NoteGroupData copyWith(
          {int? id,
          Value<String?> gameId = const Value.absent(),
          DateTime? startDate,
          DateTime? endDate,
          Status? status,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      NoteGroupData(
        id: id ?? this.id,
        gameId: gameId.present ? gameId.value : this.gameId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NoteGroupData(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, gameId, startDate, endDate, status, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteGroupData &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.status == this.status &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NoteGroupCompanion extends UpdateCompanion<NoteGroupData> {
  final Value<int> id;
  final Value<String?> gameId;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<Status> status;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NoteGroupCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.status = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NoteGroupCompanion.insert({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    required Status status,
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : startDate = Value(startDate),
        endDate = Value(endDate),
        status = Value(status),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<NoteGroupData> custom({
    Expression<int>? id,
    Expression<String>? gameId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? status,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (status != null) 'status': status,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NoteGroupCompanion copyWith(
      {Value<int>? id,
      Value<String?>? gameId,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<Status>? status,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return NoteGroupCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<String>(gameId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(
          $NoteGroupTable.$converterstatus.toSql(status.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteGroupCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('status: $status, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $NoteTable extends Note with TableInfo<$NoteTable, NoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
      'group_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES note_group (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, content, groupId, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note';
  @override
  VerificationContext validateIntegrity(Insertable<NoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $NoteTable createAlias(String alias) {
    return $NoteTable(attachedDatabase, alias);
  }
}

class NoteData extends DataClass implements Insertable<NoteData> {
  final int id;
  final String content;
  final int? groupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  const NoteData(
      {required this.id,
      required this.content,
      this.groupId,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<int>(groupId);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  NoteCompanion toCompanion(bool nullToAbsent) {
    return NoteCompanion(
      id: Value(id),
      content: Value(content),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory NoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteData(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String>(json['content']),
      groupId: serializer.fromJson<int?>(json['groupId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String>(content),
      'groupId': serializer.toJson<int?>(groupId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  NoteData copyWith(
          {int? id,
          String? content,
          Value<int?> groupId = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      NoteData(
        id: id ?? this.id,
        content: content ?? this.content,
        groupId: groupId.present ? groupId.value : this.groupId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('NoteData(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('groupId: $groupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, groupId, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteData &&
          other.id == this.id &&
          other.content == this.content &&
          other.groupId == this.groupId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class NoteCompanion extends UpdateCompanion<NoteData> {
  final Value<int> id;
  final Value<String> content;
  final Value<int?> groupId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const NoteCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.groupId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  NoteCompanion.insert({
    this.id = const Value.absent(),
    required String content,
    this.groupId = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : content = Value(content),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<NoteData> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<int>? groupId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (groupId != null) 'group_id': groupId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  NoteCompanion copyWith(
      {Value<int>? id,
      Value<String>? content,
      Value<int?>? groupId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return NoteCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      groupId: groupId ?? this.groupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteCompanion(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('groupId: $groupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $GameCacheTable extends GameCache
    with TableInfo<$GameCacheTable, GameCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GameCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gameIdMeta = const VerificationMeta('gameId');
  @override
  late final GeneratedColumn<int> gameId = GeneratedColumn<int>(
      'game_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coverUrlMeta =
      const VerificationMeta('coverUrl');
  @override
  late final GeneratedColumn<String> coverUrl = GeneratedColumn<String>(
      'cover_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, gameId, name, coverUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'game_cache';
  @override
  VerificationContext validateIntegrity(Insertable<GameCacheData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('game_id')) {
      context.handle(_gameIdMeta,
          gameId.isAcceptableOrUnknown(data['game_id']!, _gameIdMeta));
    } else if (isInserting) {
      context.missing(_gameIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover_url')) {
      context.handle(_coverUrlMeta,
          coverUrl.isAcceptableOrUnknown(data['cover_url']!, _coverUrlMeta));
    } else if (isInserting) {
      context.missing(_coverUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GameCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GameCacheData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gameId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}game_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      coverUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cover_url'])!,
    );
  }

  @override
  $GameCacheTable createAlias(String alias) {
    return $GameCacheTable(attachedDatabase, alias);
  }
}

class GameCacheData extends DataClass implements Insertable<GameCacheData> {
  final int id;
  final int gameId;
  final String name;
  final String coverUrl;
  const GameCacheData(
      {required this.id,
      required this.gameId,
      required this.name,
      required this.coverUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['game_id'] = Variable<int>(gameId);
    map['name'] = Variable<String>(name);
    map['cover_url'] = Variable<String>(coverUrl);
    return map;
  }

  GameCacheCompanion toCompanion(bool nullToAbsent) {
    return GameCacheCompanion(
      id: Value(id),
      gameId: Value(gameId),
      name: Value(name),
      coverUrl: Value(coverUrl),
    );
  }

  factory GameCacheData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GameCacheData(
      id: serializer.fromJson<int>(json['id']),
      gameId: serializer.fromJson<int>(json['gameId']),
      name: serializer.fromJson<String>(json['name']),
      coverUrl: serializer.fromJson<String>(json['coverUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gameId': serializer.toJson<int>(gameId),
      'name': serializer.toJson<String>(name),
      'coverUrl': serializer.toJson<String>(coverUrl),
    };
  }

  GameCacheData copyWith(
          {int? id, int? gameId, String? name, String? coverUrl}) =>
      GameCacheData(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        name: name ?? this.name,
        coverUrl: coverUrl ?? this.coverUrl,
      );
  @override
  String toString() {
    return (StringBuffer('GameCacheData(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('name: $name, ')
          ..write('coverUrl: $coverUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, gameId, name, coverUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameCacheData &&
          other.id == this.id &&
          other.gameId == this.gameId &&
          other.name == this.name &&
          other.coverUrl == this.coverUrl);
}

class GameCacheCompanion extends UpdateCompanion<GameCacheData> {
  final Value<int> id;
  final Value<int> gameId;
  final Value<String> name;
  final Value<String> coverUrl;
  const GameCacheCompanion({
    this.id = const Value.absent(),
    this.gameId = const Value.absent(),
    this.name = const Value.absent(),
    this.coverUrl = const Value.absent(),
  });
  GameCacheCompanion.insert({
    this.id = const Value.absent(),
    required int gameId,
    required String name,
    required String coverUrl,
  })  : gameId = Value(gameId),
        name = Value(name),
        coverUrl = Value(coverUrl);
  static Insertable<GameCacheData> custom({
    Expression<int>? id,
    Expression<int>? gameId,
    Expression<String>? name,
    Expression<String>? coverUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gameId != null) 'game_id': gameId,
      if (name != null) 'name': name,
      if (coverUrl != null) 'cover_url': coverUrl,
    });
  }

  GameCacheCompanion copyWith(
      {Value<int>? id,
      Value<int>? gameId,
      Value<String>? name,
      Value<String>? coverUrl}) {
    return GameCacheCompanion(
      id: id ?? this.id,
      gameId: gameId ?? this.gameId,
      name: name ?? this.name,
      coverUrl: coverUrl ?? this.coverUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gameId.present) {
      map['game_id'] = Variable<int>(gameId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coverUrl.present) {
      map['cover_url'] = Variable<String>(coverUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GameCacheCompanion(')
          ..write('id: $id, ')
          ..write('gameId: $gameId, ')
          ..write('name: $name, ')
          ..write('coverUrl: $coverUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $NoteGroupTable noteGroup = $NoteGroupTable(this);
  late final $NoteTable note = $NoteTable(this);
  late final $GameCacheTable gameCache = $GameCacheTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [noteGroup, note, gameCache];
}

typedef $$NoteGroupTableInsertCompanionBuilder = NoteGroupCompanion Function({
  Value<int> id,
  Value<String?> gameId,
  required DateTime startDate,
  required DateTime endDate,
  required Status status,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$NoteGroupTableUpdateCompanionBuilder = NoteGroupCompanion Function({
  Value<int> id,
  Value<String?> gameId,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<Status> status,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$NoteGroupTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteGroupTable,
    NoteGroupData,
    $$NoteGroupTableFilterComposer,
    $$NoteGroupTableOrderingComposer,
    $$NoteGroupTableProcessedTableManager,
    $$NoteGroupTableInsertCompanionBuilder,
    $$NoteGroupTableUpdateCompanionBuilder> {
  $$NoteGroupTableTableManager(_$AppDatabase db, $NoteGroupTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NoteGroupTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NoteGroupTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$NoteGroupTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> gameId = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<Status> status = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              NoteGroupCompanion(
            id: id,
            gameId: gameId,
            startDate: startDate,
            endDate: endDate,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String?> gameId = const Value.absent(),
            required DateTime startDate,
            required DateTime endDate,
            required Status status,
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              NoteGroupCompanion.insert(
            id: id,
            gameId: gameId,
            startDate: startDate,
            endDate: endDate,
            status: status,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$NoteGroupTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $NoteGroupTable,
    NoteGroupData,
    $$NoteGroupTableFilterComposer,
    $$NoteGroupTableOrderingComposer,
    $$NoteGroupTableProcessedTableManager,
    $$NoteGroupTableInsertCompanionBuilder,
    $$NoteGroupTableUpdateCompanionBuilder> {
  $$NoteGroupTableProcessedTableManager(super.$state);
}

class $$NoteGroupTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NoteGroupTable> {
  $$NoteGroupTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get gameId => $state.composableBuilder(
      column: $state.table.gameId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Status, Status, String> get status =>
      $state.composableBuilder(
          column: $state.table.status,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter noteRefs(
      ComposableFilter Function($$NoteTableFilterComposer f) f) {
    final $$NoteTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.note,
        getReferencedColumn: (t) => t.groupId,
        builder: (joinBuilder, parentComposers) => $$NoteTableFilterComposer(
            ComposerState(
                $state.db, $state.db.note, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$NoteGroupTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NoteGroupTable> {
  $$NoteGroupTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get gameId => $state.composableBuilder(
      column: $state.table.gameId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get startDate => $state.composableBuilder(
      column: $state.table.startDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get endDate => $state.composableBuilder(
      column: $state.table.endDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get status => $state.composableBuilder(
      column: $state.table.status,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$NoteTableInsertCompanionBuilder = NoteCompanion Function({
  Value<int> id,
  required String content,
  Value<int?> groupId,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$NoteTableUpdateCompanionBuilder = NoteCompanion Function({
  Value<int> id,
  Value<String> content,
  Value<int?> groupId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

class $$NoteTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteTable,
    NoteData,
    $$NoteTableFilterComposer,
    $$NoteTableOrderingComposer,
    $$NoteTableProcessedTableManager,
    $$NoteTableInsertCompanionBuilder,
    $$NoteTableUpdateCompanionBuilder> {
  $$NoteTableTableManager(_$AppDatabase db, $NoteTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$NoteTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$NoteTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) => $$NoteTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int?> groupId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              NoteCompanion(
            id: id,
            content: content,
            groupId: groupId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String content,
            Value<int?> groupId = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              NoteCompanion.insert(
            id: id,
            content: content,
            groupId: groupId,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
        ));
}

class $$NoteTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $NoteTable,
    NoteData,
    $$NoteTableFilterComposer,
    $$NoteTableOrderingComposer,
    $$NoteTableProcessedTableManager,
    $$NoteTableInsertCompanionBuilder,
    $$NoteTableUpdateCompanionBuilder> {
  $$NoteTableProcessedTableManager(super.$state);
}

class $$NoteTableFilterComposer
    extends FilterComposer<_$AppDatabase, $NoteTable> {
  $$NoteTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$NoteGroupTableFilterComposer get groupId {
    final $$NoteGroupTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.noteGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$NoteGroupTableFilterComposer(ComposerState(
                $state.db, $state.db.noteGroup, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$NoteTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $NoteTable> {
  $$NoteTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get content => $state.composableBuilder(
      column: $state.table.content,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get createdAt => $state.composableBuilder(
      column: $state.table.createdAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$NoteGroupTableOrderingComposer get groupId {
    final $$NoteGroupTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.groupId,
        referencedTable: $state.db.noteGroup,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$NoteGroupTableOrderingComposer(ComposerState(
                $state.db, $state.db.noteGroup, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$GameCacheTableInsertCompanionBuilder = GameCacheCompanion Function({
  Value<int> id,
  required int gameId,
  required String name,
  required String coverUrl,
});
typedef $$GameCacheTableUpdateCompanionBuilder = GameCacheCompanion Function({
  Value<int> id,
  Value<int> gameId,
  Value<String> name,
  Value<String> coverUrl,
});

class $$GameCacheTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GameCacheTable,
    GameCacheData,
    $$GameCacheTableFilterComposer,
    $$GameCacheTableOrderingComposer,
    $$GameCacheTableProcessedTableManager,
    $$GameCacheTableInsertCompanionBuilder,
    $$GameCacheTableUpdateCompanionBuilder> {
  $$GameCacheTableTableManager(_$AppDatabase db, $GameCacheTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$GameCacheTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$GameCacheTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$GameCacheTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<int> gameId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> coverUrl = const Value.absent(),
          }) =>
              GameCacheCompanion(
            id: id,
            gameId: gameId,
            name: name,
            coverUrl: coverUrl,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required int gameId,
            required String name,
            required String coverUrl,
          }) =>
              GameCacheCompanion.insert(
            id: id,
            gameId: gameId,
            name: name,
            coverUrl: coverUrl,
          ),
        ));
}

class $$GameCacheTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $GameCacheTable,
    GameCacheData,
    $$GameCacheTableFilterComposer,
    $$GameCacheTableOrderingComposer,
    $$GameCacheTableProcessedTableManager,
    $$GameCacheTableInsertCompanionBuilder,
    $$GameCacheTableUpdateCompanionBuilder> {
  $$GameCacheTableProcessedTableManager(super.$state);
}

class $$GameCacheTableFilterComposer
    extends FilterComposer<_$AppDatabase, $GameCacheTable> {
  $$GameCacheTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get gameId => $state.composableBuilder(
      column: $state.table.gameId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get coverUrl => $state.composableBuilder(
      column: $state.table.coverUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$GameCacheTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $GameCacheTable> {
  $$GameCacheTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get gameId => $state.composableBuilder(
      column: $state.table.gameId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get coverUrl => $state.composableBuilder(
      column: $state.table.coverUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$NoteGroupTableTableManager get noteGroup =>
      $$NoteGroupTableTableManager(_db, _db.noteGroup);
  $$NoteTableTableManager get note => $$NoteTableTableManager(_db, _db.note);
  $$GameCacheTableTableManager get gameCache =>
      $$GameCacheTableTableManager(_db, _db.gameCache);
}
