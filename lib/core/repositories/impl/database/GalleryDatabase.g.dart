// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GalleryDatabase.dart';

// ignore_for_file: type=lint
class $ImageEntitiesTable extends ImageEntities
    with TableInfo<$ImageEntitiesTable, ImageEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImageEntitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<ImageSource, String> source =
      GeneratedColumn<String>(
        'source',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ImageSource>($ImageEntitiesTable.$convertersource);
  static const VerificationMeta _networkUrlMeta = const VerificationMeta(
    'networkUrl',
  );
  @override
  late final GeneratedColumn<String> networkUrl = GeneratedColumn<String>(
    'network_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [uuid, source, networkUrl, localPath];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'image_entities';
  @override
  VerificationContext validateIntegrity(
    Insertable<ImageEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('network_url')) {
      context.handle(
        _networkUrlMeta,
        networkUrl.isAcceptableOrUnknown(data['network_url']!, _networkUrlMeta),
      );
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ImageEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ImageEntity(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      source: $ImageEntitiesTable.$convertersource.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}source'],
        )!,
      ),
      networkUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}network_url'],
      ),
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
    );
  }

  @override
  $ImageEntitiesTable createAlias(String alias) {
    return $ImageEntitiesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ImageSource, String, String> $convertersource =
      const EnumNameConverter<ImageSource>(ImageSource.values);
}

class ImageEntity extends DataClass implements Insertable<ImageEntity> {
  final String uuid;
  final ImageSource source;
  final String? networkUrl;
  final String localPath;
  const ImageEntity({
    required this.uuid,
    required this.source,
    this.networkUrl,
    required this.localPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    {
      map['source'] = Variable<String>(
        $ImageEntitiesTable.$convertersource.toSql(source),
      );
    }
    if (!nullToAbsent || networkUrl != null) {
      map['network_url'] = Variable<String>(networkUrl);
    }
    map['local_path'] = Variable<String>(localPath);
    return map;
  }

  ImageEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ImageEntitiesCompanion(
      uuid: Value(uuid),
      source: Value(source),
      networkUrl: networkUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(networkUrl),
      localPath: Value(localPath),
    );
  }

  factory ImageEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ImageEntity(
      uuid: serializer.fromJson<String>(json['uuid']),
      source: $ImageEntitiesTable.$convertersource.fromJson(
        serializer.fromJson<String>(json['source']),
      ),
      networkUrl: serializer.fromJson<String?>(json['networkUrl']),
      localPath: serializer.fromJson<String>(json['localPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'source': serializer.toJson<String>(
        $ImageEntitiesTable.$convertersource.toJson(source),
      ),
      'networkUrl': serializer.toJson<String?>(networkUrl),
      'localPath': serializer.toJson<String>(localPath),
    };
  }

  ImageEntity copyWith({
    String? uuid,
    ImageSource? source,
    Value<String?> networkUrl = const Value.absent(),
    String? localPath,
  }) => ImageEntity(
    uuid: uuid ?? this.uuid,
    source: source ?? this.source,
    networkUrl: networkUrl.present ? networkUrl.value : this.networkUrl,
    localPath: localPath ?? this.localPath,
  );
  ImageEntity copyWithCompanion(ImageEntitiesCompanion data) {
    return ImageEntity(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      source: data.source.present ? data.source.value : this.source,
      networkUrl: data.networkUrl.present
          ? data.networkUrl.value
          : this.networkUrl,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ImageEntity(')
          ..write('uuid: $uuid, ')
          ..write('source: $source, ')
          ..write('networkUrl: $networkUrl, ')
          ..write('localPath: $localPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uuid, source, networkUrl, localPath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageEntity &&
          other.uuid == this.uuid &&
          other.source == this.source &&
          other.networkUrl == this.networkUrl &&
          other.localPath == this.localPath);
}

class ImageEntitiesCompanion extends UpdateCompanion<ImageEntity> {
  final Value<String> uuid;
  final Value<ImageSource> source;
  final Value<String?> networkUrl;
  final Value<String> localPath;
  final Value<int> rowid;
  const ImageEntitiesCompanion({
    this.uuid = const Value.absent(),
    this.source = const Value.absent(),
    this.networkUrl = const Value.absent(),
    this.localPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ImageEntitiesCompanion.insert({
    required String uuid,
    required ImageSource source,
    this.networkUrl = const Value.absent(),
    required String localPath,
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       source = Value(source),
       localPath = Value(localPath);
  static Insertable<ImageEntity> custom({
    Expression<String>? uuid,
    Expression<String>? source,
    Expression<String>? networkUrl,
    Expression<String>? localPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (source != null) 'source': source,
      if (networkUrl != null) 'network_url': networkUrl,
      if (localPath != null) 'local_path': localPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ImageEntitiesCompanion copyWith({
    Value<String>? uuid,
    Value<ImageSource>? source,
    Value<String?>? networkUrl,
    Value<String>? localPath,
    Value<int>? rowid,
  }) {
    return ImageEntitiesCompanion(
      uuid: uuid ?? this.uuid,
      source: source ?? this.source,
      networkUrl: networkUrl ?? this.networkUrl,
      localPath: localPath ?? this.localPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(
        $ImageEntitiesTable.$convertersource.toSql(source.value),
      );
    }
    if (networkUrl.present) {
      map['network_url'] = Variable<String>(networkUrl.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImageEntitiesCompanion(')
          ..write('uuid: $uuid, ')
          ..write('source: $source, ')
          ..write('networkUrl: $networkUrl, ')
          ..write('localPath: $localPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$GalleryDatabase extends GeneratedDatabase {
  _$GalleryDatabase(QueryExecutor e) : super(e);
  $GalleryDatabaseManager get managers => $GalleryDatabaseManager(this);
  late final $ImageEntitiesTable imageEntities = $ImageEntitiesTable(this);
  late final ImageDao imageDao = ImageDao(this as GalleryDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [imageEntities];
}

typedef $$ImageEntitiesTableCreateCompanionBuilder =
    ImageEntitiesCompanion Function({
      required String uuid,
      required ImageSource source,
      Value<String?> networkUrl,
      required String localPath,
      Value<int> rowid,
    });
typedef $$ImageEntitiesTableUpdateCompanionBuilder =
    ImageEntitiesCompanion Function({
      Value<String> uuid,
      Value<ImageSource> source,
      Value<String?> networkUrl,
      Value<String> localPath,
      Value<int> rowid,
    });

class $$ImageEntitiesTableFilterComposer
    extends Composer<_$GalleryDatabase, $ImageEntitiesTable> {
  $$ImageEntitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ImageSource, ImageSource, String> get source =>
      $composableBuilder(
        column: $table.source,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get networkUrl => $composableBuilder(
    column: $table.networkUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ImageEntitiesTableOrderingComposer
    extends Composer<_$GalleryDatabase, $ImageEntitiesTable> {
  $$ImageEntitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get networkUrl => $composableBuilder(
    column: $table.networkUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImageEntitiesTableAnnotationComposer
    extends Composer<_$GalleryDatabase, $ImageEntitiesTable> {
  $$ImageEntitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ImageSource, String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get networkUrl => $composableBuilder(
    column: $table.networkUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);
}

class $$ImageEntitiesTableTableManager
    extends
        RootTableManager<
          _$GalleryDatabase,
          $ImageEntitiesTable,
          ImageEntity,
          $$ImageEntitiesTableFilterComposer,
          $$ImageEntitiesTableOrderingComposer,
          $$ImageEntitiesTableAnnotationComposer,
          $$ImageEntitiesTableCreateCompanionBuilder,
          $$ImageEntitiesTableUpdateCompanionBuilder,
          (
            ImageEntity,
            BaseReferences<_$GalleryDatabase, $ImageEntitiesTable, ImageEntity>,
          ),
          ImageEntity,
          PrefetchHooks Function()
        > {
  $$ImageEntitiesTableTableManager(
    _$GalleryDatabase db,
    $ImageEntitiesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImageEntitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImageEntitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImageEntitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<ImageSource> source = const Value.absent(),
                Value<String?> networkUrl = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ImageEntitiesCompanion(
                uuid: uuid,
                source: source,
                networkUrl: networkUrl,
                localPath: localPath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required ImageSource source,
                Value<String?> networkUrl = const Value.absent(),
                required String localPath,
                Value<int> rowid = const Value.absent(),
              }) => ImageEntitiesCompanion.insert(
                uuid: uuid,
                source: source,
                networkUrl: networkUrl,
                localPath: localPath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ImageEntitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$GalleryDatabase,
      $ImageEntitiesTable,
      ImageEntity,
      $$ImageEntitiesTableFilterComposer,
      $$ImageEntitiesTableOrderingComposer,
      $$ImageEntitiesTableAnnotationComposer,
      $$ImageEntitiesTableCreateCompanionBuilder,
      $$ImageEntitiesTableUpdateCompanionBuilder,
      (
        ImageEntity,
        BaseReferences<_$GalleryDatabase, $ImageEntitiesTable, ImageEntity>,
      ),
      ImageEntity,
      PrefetchHooks Function()
    >;

class $GalleryDatabaseManager {
  final _$GalleryDatabase _db;
  $GalleryDatabaseManager(this._db);
  $$ImageEntitiesTableTableManager get imageEntities =>
      $$ImageEntitiesTableTableManager(_db, _db.imageEntities);
}
