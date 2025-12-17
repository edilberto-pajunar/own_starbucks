// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table.dart';

// ignore_for_file: type=lint
class $CustomizedDrinksTableTable extends CustomizedDrinksTable
    with TableInfo<$CustomizedDrinksTableTable, CustomizedDrinksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomizedDrinksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _customNameMeta = const VerificationMeta(
    'customName',
  );
  @override
  late final GeneratedColumn<String> customName = GeneratedColumn<String>(
    'custom_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseDrinkMeta = const VerificationMeta(
    'baseDrink',
  );
  @override
  late final GeneratedColumn<String> baseDrink = GeneratedColumn<String>(
    'base_drink',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _milkTypeMeta = const VerificationMeta(
    'milkType',
  );
  @override
  late final GeneratedColumn<String> milkType = GeneratedColumn<String>(
    'milk_type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sugarLevelMeta = const VerificationMeta(
    'sugarLevel',
  );
  @override
  late final GeneratedColumn<String> sugarLevel = GeneratedColumn<String>(
    'sugar_level',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cupSizeMeta = const VerificationMeta(
    'cupSize',
  );
  @override
  late final GeneratedColumn<String> cupSize = GeneratedColumn<String>(
    'cup_size',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _extrasMeta = const VerificationMeta('extras');
  @override
  late final GeneratedColumn<String> extras = GeneratedColumn<String>(
    'extras',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalPriceMeta = const VerificationMeta(
    'totalPrice',
  );
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
    'total_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    customName,
    baseDrink,
    milkType,
    sugarLevel,
    cupSize,
    extras,
    totalPrice,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customized_drinks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomizedDrinksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('custom_name')) {
      context.handle(
        _customNameMeta,
        customName.isAcceptableOrUnknown(data['custom_name']!, _customNameMeta),
      );
    } else if (isInserting) {
      context.missing(_customNameMeta);
    }
    if (data.containsKey('base_drink')) {
      context.handle(
        _baseDrinkMeta,
        baseDrink.isAcceptableOrUnknown(data['base_drink']!, _baseDrinkMeta),
      );
    } else if (isInserting) {
      context.missing(_baseDrinkMeta);
    }
    if (data.containsKey('milk_type')) {
      context.handle(
        _milkTypeMeta,
        milkType.isAcceptableOrUnknown(data['milk_type']!, _milkTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_milkTypeMeta);
    }
    if (data.containsKey('sugar_level')) {
      context.handle(
        _sugarLevelMeta,
        sugarLevel.isAcceptableOrUnknown(data['sugar_level']!, _sugarLevelMeta),
      );
    } else if (isInserting) {
      context.missing(_sugarLevelMeta);
    }
    if (data.containsKey('cup_size')) {
      context.handle(
        _cupSizeMeta,
        cupSize.isAcceptableOrUnknown(data['cup_size']!, _cupSizeMeta),
      );
    } else if (isInserting) {
      context.missing(_cupSizeMeta);
    }
    if (data.containsKey('extras')) {
      context.handle(
        _extrasMeta,
        extras.isAcceptableOrUnknown(data['extras']!, _extrasMeta),
      );
    } else if (isInserting) {
      context.missing(_extrasMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
        _totalPriceMeta,
        totalPrice.isAcceptableOrUnknown(data['total_price']!, _totalPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomizedDrinksTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomizedDrinksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      customName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_name'],
      )!,
      baseDrink: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_drink'],
      )!,
      milkType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}milk_type'],
      )!,
      sugarLevel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sugar_level'],
      )!,
      cupSize: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cup_size'],
      )!,
      extras: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}extras'],
      )!,
      totalPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}total_price'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $CustomizedDrinksTableTable createAlias(String alias) {
    return $CustomizedDrinksTableTable(attachedDatabase, alias);
  }
}

class CustomizedDrinksTableData extends DataClass
    implements Insertable<CustomizedDrinksTableData> {
  final int id;
  final String customName;
  final String baseDrink;
  final String milkType;
  final String sugarLevel;
  final String cupSize;
  final String extras;
  final double totalPrice;
  final DateTime createdAt;
  const CustomizedDrinksTableData({
    required this.id,
    required this.customName,
    required this.baseDrink,
    required this.milkType,
    required this.sugarLevel,
    required this.cupSize,
    required this.extras,
    required this.totalPrice,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['custom_name'] = Variable<String>(customName);
    map['base_drink'] = Variable<String>(baseDrink);
    map['milk_type'] = Variable<String>(milkType);
    map['sugar_level'] = Variable<String>(sugarLevel);
    map['cup_size'] = Variable<String>(cupSize);
    map['extras'] = Variable<String>(extras);
    map['total_price'] = Variable<double>(totalPrice);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomizedDrinksTableCompanion toCompanion(bool nullToAbsent) {
    return CustomizedDrinksTableCompanion(
      id: Value(id),
      customName: Value(customName),
      baseDrink: Value(baseDrink),
      milkType: Value(milkType),
      sugarLevel: Value(sugarLevel),
      cupSize: Value(cupSize),
      extras: Value(extras),
      totalPrice: Value(totalPrice),
      createdAt: Value(createdAt),
    );
  }

  factory CustomizedDrinksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomizedDrinksTableData(
      id: serializer.fromJson<int>(json['id']),
      customName: serializer.fromJson<String>(json['customName']),
      baseDrink: serializer.fromJson<String>(json['baseDrink']),
      milkType: serializer.fromJson<String>(json['milkType']),
      sugarLevel: serializer.fromJson<String>(json['sugarLevel']),
      cupSize: serializer.fromJson<String>(json['cupSize']),
      extras: serializer.fromJson<String>(json['extras']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'customName': serializer.toJson<String>(customName),
      'baseDrink': serializer.toJson<String>(baseDrink),
      'milkType': serializer.toJson<String>(milkType),
      'sugarLevel': serializer.toJson<String>(sugarLevel),
      'cupSize': serializer.toJson<String>(cupSize),
      'extras': serializer.toJson<String>(extras),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CustomizedDrinksTableData copyWith({
    int? id,
    String? customName,
    String? baseDrink,
    String? milkType,
    String? sugarLevel,
    String? cupSize,
    String? extras,
    double? totalPrice,
    DateTime? createdAt,
  }) => CustomizedDrinksTableData(
    id: id ?? this.id,
    customName: customName ?? this.customName,
    baseDrink: baseDrink ?? this.baseDrink,
    milkType: milkType ?? this.milkType,
    sugarLevel: sugarLevel ?? this.sugarLevel,
    cupSize: cupSize ?? this.cupSize,
    extras: extras ?? this.extras,
    totalPrice: totalPrice ?? this.totalPrice,
    createdAt: createdAt ?? this.createdAt,
  );
  CustomizedDrinksTableData copyWithCompanion(
    CustomizedDrinksTableCompanion data,
  ) {
    return CustomizedDrinksTableData(
      id: data.id.present ? data.id.value : this.id,
      customName: data.customName.present
          ? data.customName.value
          : this.customName,
      baseDrink: data.baseDrink.present ? data.baseDrink.value : this.baseDrink,
      milkType: data.milkType.present ? data.milkType.value : this.milkType,
      sugarLevel: data.sugarLevel.present
          ? data.sugarLevel.value
          : this.sugarLevel,
      cupSize: data.cupSize.present ? data.cupSize.value : this.cupSize,
      extras: data.extras.present ? data.extras.value : this.extras,
      totalPrice: data.totalPrice.present
          ? data.totalPrice.value
          : this.totalPrice,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomizedDrinksTableData(')
          ..write('id: $id, ')
          ..write('customName: $customName, ')
          ..write('baseDrink: $baseDrink, ')
          ..write('milkType: $milkType, ')
          ..write('sugarLevel: $sugarLevel, ')
          ..write('cupSize: $cupSize, ')
          ..write('extras: $extras, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    customName,
    baseDrink,
    milkType,
    sugarLevel,
    cupSize,
    extras,
    totalPrice,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomizedDrinksTableData &&
          other.id == this.id &&
          other.customName == this.customName &&
          other.baseDrink == this.baseDrink &&
          other.milkType == this.milkType &&
          other.sugarLevel == this.sugarLevel &&
          other.cupSize == this.cupSize &&
          other.extras == this.extras &&
          other.totalPrice == this.totalPrice &&
          other.createdAt == this.createdAt);
}

class CustomizedDrinksTableCompanion
    extends UpdateCompanion<CustomizedDrinksTableData> {
  final Value<int> id;
  final Value<String> customName;
  final Value<String> baseDrink;
  final Value<String> milkType;
  final Value<String> sugarLevel;
  final Value<String> cupSize;
  final Value<String> extras;
  final Value<double> totalPrice;
  final Value<DateTime> createdAt;
  const CustomizedDrinksTableCompanion({
    this.id = const Value.absent(),
    this.customName = const Value.absent(),
    this.baseDrink = const Value.absent(),
    this.milkType = const Value.absent(),
    this.sugarLevel = const Value.absent(),
    this.cupSize = const Value.absent(),
    this.extras = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomizedDrinksTableCompanion.insert({
    this.id = const Value.absent(),
    required String customName,
    required String baseDrink,
    required String milkType,
    required String sugarLevel,
    required String cupSize,
    required String extras,
    required double totalPrice,
    required DateTime createdAt,
  }) : customName = Value(customName),
       baseDrink = Value(baseDrink),
       milkType = Value(milkType),
       sugarLevel = Value(sugarLevel),
       cupSize = Value(cupSize),
       extras = Value(extras),
       totalPrice = Value(totalPrice),
       createdAt = Value(createdAt);
  static Insertable<CustomizedDrinksTableData> custom({
    Expression<int>? id,
    Expression<String>? customName,
    Expression<String>? baseDrink,
    Expression<String>? milkType,
    Expression<String>? sugarLevel,
    Expression<String>? cupSize,
    Expression<String>? extras,
    Expression<double>? totalPrice,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (customName != null) 'custom_name': customName,
      if (baseDrink != null) 'base_drink': baseDrink,
      if (milkType != null) 'milk_type': milkType,
      if (sugarLevel != null) 'sugar_level': sugarLevel,
      if (cupSize != null) 'cup_size': cupSize,
      if (extras != null) 'extras': extras,
      if (totalPrice != null) 'total_price': totalPrice,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomizedDrinksTableCompanion copyWith({
    Value<int>? id,
    Value<String>? customName,
    Value<String>? baseDrink,
    Value<String>? milkType,
    Value<String>? sugarLevel,
    Value<String>? cupSize,
    Value<String>? extras,
    Value<double>? totalPrice,
    Value<DateTime>? createdAt,
  }) {
    return CustomizedDrinksTableCompanion(
      id: id ?? this.id,
      customName: customName ?? this.customName,
      baseDrink: baseDrink ?? this.baseDrink,
      milkType: milkType ?? this.milkType,
      sugarLevel: sugarLevel ?? this.sugarLevel,
      cupSize: cupSize ?? this.cupSize,
      extras: extras ?? this.extras,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (customName.present) {
      map['custom_name'] = Variable<String>(customName.value);
    }
    if (baseDrink.present) {
      map['base_drink'] = Variable<String>(baseDrink.value);
    }
    if (milkType.present) {
      map['milk_type'] = Variable<String>(milkType.value);
    }
    if (sugarLevel.present) {
      map['sugar_level'] = Variable<String>(sugarLevel.value);
    }
    if (cupSize.present) {
      map['cup_size'] = Variable<String>(cupSize.value);
    }
    if (extras.present) {
      map['extras'] = Variable<String>(extras.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomizedDrinksTableCompanion(')
          ..write('id: $id, ')
          ..write('customName: $customName, ')
          ..write('baseDrink: $baseDrink, ')
          ..write('milkType: $milkType, ')
          ..write('sugarLevel: $sugarLevel, ')
          ..write('cupSize: $cupSize, ')
          ..write('extras: $extras, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomizedDrinksTableTable customizedDrinksTable =
      $CustomizedDrinksTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [customizedDrinksTable];
}

typedef $$CustomizedDrinksTableTableCreateCompanionBuilder =
    CustomizedDrinksTableCompanion Function({
      Value<int> id,
      required String customName,
      required String baseDrink,
      required String milkType,
      required String sugarLevel,
      required String cupSize,
      required String extras,
      required double totalPrice,
      required DateTime createdAt,
    });
typedef $$CustomizedDrinksTableTableUpdateCompanionBuilder =
    CustomizedDrinksTableCompanion Function({
      Value<int> id,
      Value<String> customName,
      Value<String> baseDrink,
      Value<String> milkType,
      Value<String> sugarLevel,
      Value<String> cupSize,
      Value<String> extras,
      Value<double> totalPrice,
      Value<DateTime> createdAt,
    });

class $$CustomizedDrinksTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomizedDrinksTableTable> {
  $$CustomizedDrinksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseDrink => $composableBuilder(
    column: $table.baseDrink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get milkType => $composableBuilder(
    column: $table.milkType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sugarLevel => $composableBuilder(
    column: $table.sugarLevel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cupSize => $composableBuilder(
    column: $table.cupSize,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get extras => $composableBuilder(
    column: $table.extras,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CustomizedDrinksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomizedDrinksTableTable> {
  $$CustomizedDrinksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseDrink => $composableBuilder(
    column: $table.baseDrink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get milkType => $composableBuilder(
    column: $table.milkType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sugarLevel => $composableBuilder(
    column: $table.sugarLevel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cupSize => $composableBuilder(
    column: $table.cupSize,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get extras => $composableBuilder(
    column: $table.extras,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CustomizedDrinksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomizedDrinksTableTable> {
  $$CustomizedDrinksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get customName => $composableBuilder(
    column: $table.customName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get baseDrink =>
      $composableBuilder(column: $table.baseDrink, builder: (column) => column);

  GeneratedColumn<String> get milkType =>
      $composableBuilder(column: $table.milkType, builder: (column) => column);

  GeneratedColumn<String> get sugarLevel => $composableBuilder(
    column: $table.sugarLevel,
    builder: (column) => column,
  );

  GeneratedColumn<String> get cupSize =>
      $composableBuilder(column: $table.cupSize, builder: (column) => column);

  GeneratedColumn<String> get extras =>
      $composableBuilder(column: $table.extras, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
    column: $table.totalPrice,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$CustomizedDrinksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomizedDrinksTableTable,
          CustomizedDrinksTableData,
          $$CustomizedDrinksTableTableFilterComposer,
          $$CustomizedDrinksTableTableOrderingComposer,
          $$CustomizedDrinksTableTableAnnotationComposer,
          $$CustomizedDrinksTableTableCreateCompanionBuilder,
          $$CustomizedDrinksTableTableUpdateCompanionBuilder,
          (
            CustomizedDrinksTableData,
            BaseReferences<
              _$AppDatabase,
              $CustomizedDrinksTableTable,
              CustomizedDrinksTableData
            >,
          ),
          CustomizedDrinksTableData,
          PrefetchHooks Function()
        > {
  $$CustomizedDrinksTableTableTableManager(
    _$AppDatabase db,
    $CustomizedDrinksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomizedDrinksTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CustomizedDrinksTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CustomizedDrinksTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> customName = const Value.absent(),
                Value<String> baseDrink = const Value.absent(),
                Value<String> milkType = const Value.absent(),
                Value<String> sugarLevel = const Value.absent(),
                Value<String> cupSize = const Value.absent(),
                Value<String> extras = const Value.absent(),
                Value<double> totalPrice = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CustomizedDrinksTableCompanion(
                id: id,
                customName: customName,
                baseDrink: baseDrink,
                milkType: milkType,
                sugarLevel: sugarLevel,
                cupSize: cupSize,
                extras: extras,
                totalPrice: totalPrice,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String customName,
                required String baseDrink,
                required String milkType,
                required String sugarLevel,
                required String cupSize,
                required String extras,
                required double totalPrice,
                required DateTime createdAt,
              }) => CustomizedDrinksTableCompanion.insert(
                id: id,
                customName: customName,
                baseDrink: baseDrink,
                milkType: milkType,
                sugarLevel: sugarLevel,
                cupSize: cupSize,
                extras: extras,
                totalPrice: totalPrice,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CustomizedDrinksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomizedDrinksTableTable,
      CustomizedDrinksTableData,
      $$CustomizedDrinksTableTableFilterComposer,
      $$CustomizedDrinksTableTableOrderingComposer,
      $$CustomizedDrinksTableTableAnnotationComposer,
      $$CustomizedDrinksTableTableCreateCompanionBuilder,
      $$CustomizedDrinksTableTableUpdateCompanionBuilder,
      (
        CustomizedDrinksTableData,
        BaseReferences<
          _$AppDatabase,
          $CustomizedDrinksTableTable,
          CustomizedDrinksTableData
        >,
      ),
      CustomizedDrinksTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomizedDrinksTableTableTableManager get customizedDrinksTable =>
      $$CustomizedDrinksTableTableTableManager(_db, _db.customizedDrinksTable);
}
