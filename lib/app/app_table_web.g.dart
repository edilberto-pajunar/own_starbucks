// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_table_web.dart';

// ignore_for_file: type=lint
class $CustomDrinksTableTable extends CustomDrinksTable
    with TableInfo<$CustomDrinksTableTable, CustomDrinksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomDrinksTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseDrinkNameMeta = const VerificationMeta(
    'baseDrinkName',
  );
  @override
  late final GeneratedColumn<String> baseDrinkName = GeneratedColumn<String>(
    'base_drink_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _baseDrinkPhotoMeta = const VerificationMeta(
    'baseDrinkPhoto',
  );
  @override
  late final GeneratedColumn<String> baseDrinkPhoto = GeneratedColumn<String>(
    'base_drink_photo',
    aliasedName,
    false,
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
    name,
    baseDrinkName,
    baseDrinkPhoto,
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
  static const String $name = 'custom_drinks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomDrinksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('base_drink_name')) {
      context.handle(
        _baseDrinkNameMeta,
        baseDrinkName.isAcceptableOrUnknown(
          data['base_drink_name']!,
          _baseDrinkNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseDrinkNameMeta);
    }
    if (data.containsKey('base_drink_photo')) {
      context.handle(
        _baseDrinkPhotoMeta,
        baseDrinkPhoto.isAcceptableOrUnknown(
          data['base_drink_photo']!,
          _baseDrinkPhotoMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_baseDrinkPhotoMeta);
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
  CustomDrinksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomDrinksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      baseDrinkName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_drink_name'],
      )!,
      baseDrinkPhoto: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}base_drink_photo'],
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
  $CustomDrinksTableTable createAlias(String alias) {
    return $CustomDrinksTableTable(attachedDatabase, alias);
  }
}

class CustomDrinksTableData extends DataClass
    implements Insertable<CustomDrinksTableData> {
  final int id;
  final String name;
  final String baseDrinkName;
  final String baseDrinkPhoto;
  final String milkType;
  final String sugarLevel;
  final String cupSize;
  final String extras;
  final double totalPrice;
  final DateTime createdAt;
  const CustomDrinksTableData({
    required this.id,
    required this.name,
    required this.baseDrinkName,
    required this.baseDrinkPhoto,
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
    map['name'] = Variable<String>(name);
    map['base_drink_name'] = Variable<String>(baseDrinkName);
    map['base_drink_photo'] = Variable<String>(baseDrinkPhoto);
    map['milk_type'] = Variable<String>(milkType);
    map['sugar_level'] = Variable<String>(sugarLevel);
    map['cup_size'] = Variable<String>(cupSize);
    map['extras'] = Variable<String>(extras);
    map['total_price'] = Variable<double>(totalPrice);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  CustomDrinksTableCompanion toCompanion(bool nullToAbsent) {
    return CustomDrinksTableCompanion(
      id: Value(id),
      name: Value(name),
      baseDrinkName: Value(baseDrinkName),
      baseDrinkPhoto: Value(baseDrinkPhoto),
      milkType: Value(milkType),
      sugarLevel: Value(sugarLevel),
      cupSize: Value(cupSize),
      extras: Value(extras),
      totalPrice: Value(totalPrice),
      createdAt: Value(createdAt),
    );
  }

  factory CustomDrinksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomDrinksTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      baseDrinkName: serializer.fromJson<String>(json['baseDrinkName']),
      baseDrinkPhoto: serializer.fromJson<String>(json['baseDrinkPhoto']),
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
      'name': serializer.toJson<String>(name),
      'baseDrinkName': serializer.toJson<String>(baseDrinkName),
      'baseDrinkPhoto': serializer.toJson<String>(baseDrinkPhoto),
      'milkType': serializer.toJson<String>(milkType),
      'sugarLevel': serializer.toJson<String>(sugarLevel),
      'cupSize': serializer.toJson<String>(cupSize),
      'extras': serializer.toJson<String>(extras),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  CustomDrinksTableData copyWith({
    int? id,
    String? name,
    String? baseDrinkName,
    String? baseDrinkPhoto,
    String? milkType,
    String? sugarLevel,
    String? cupSize,
    String? extras,
    double? totalPrice,
    DateTime? createdAt,
  }) => CustomDrinksTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    baseDrinkName: baseDrinkName ?? this.baseDrinkName,
    baseDrinkPhoto: baseDrinkPhoto ?? this.baseDrinkPhoto,
    milkType: milkType ?? this.milkType,
    sugarLevel: sugarLevel ?? this.sugarLevel,
    cupSize: cupSize ?? this.cupSize,
    extras: extras ?? this.extras,
    totalPrice: totalPrice ?? this.totalPrice,
    createdAt: createdAt ?? this.createdAt,
  );
  CustomDrinksTableData copyWithCompanion(CustomDrinksTableCompanion data) {
    return CustomDrinksTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      baseDrinkName: data.baseDrinkName.present
          ? data.baseDrinkName.value
          : this.baseDrinkName,
      baseDrinkPhoto: data.baseDrinkPhoto.present
          ? data.baseDrinkPhoto.value
          : this.baseDrinkPhoto,
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
    return (StringBuffer('CustomDrinksTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('baseDrinkName: $baseDrinkName, ')
          ..write('baseDrinkPhoto: $baseDrinkPhoto, ')
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
    name,
    baseDrinkName,
    baseDrinkPhoto,
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
      (other is CustomDrinksTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.baseDrinkName == this.baseDrinkName &&
          other.baseDrinkPhoto == this.baseDrinkPhoto &&
          other.milkType == this.milkType &&
          other.sugarLevel == this.sugarLevel &&
          other.cupSize == this.cupSize &&
          other.extras == this.extras &&
          other.totalPrice == this.totalPrice &&
          other.createdAt == this.createdAt);
}

class CustomDrinksTableCompanion
    extends UpdateCompanion<CustomDrinksTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> baseDrinkName;
  final Value<String> baseDrinkPhoto;
  final Value<String> milkType;
  final Value<String> sugarLevel;
  final Value<String> cupSize;
  final Value<String> extras;
  final Value<double> totalPrice;
  final Value<DateTime> createdAt;
  const CustomDrinksTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.baseDrinkName = const Value.absent(),
    this.baseDrinkPhoto = const Value.absent(),
    this.milkType = const Value.absent(),
    this.sugarLevel = const Value.absent(),
    this.cupSize = const Value.absent(),
    this.extras = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  CustomDrinksTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String baseDrinkName,
    required String baseDrinkPhoto,
    required String milkType,
    required String sugarLevel,
    required String cupSize,
    required String extras,
    required double totalPrice,
    required DateTime createdAt,
  }) : name = Value(name),
       baseDrinkName = Value(baseDrinkName),
       baseDrinkPhoto = Value(baseDrinkPhoto),
       milkType = Value(milkType),
       sugarLevel = Value(sugarLevel),
       cupSize = Value(cupSize),
       extras = Value(extras),
       totalPrice = Value(totalPrice),
       createdAt = Value(createdAt);
  static Insertable<CustomDrinksTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? baseDrinkName,
    Expression<String>? baseDrinkPhoto,
    Expression<String>? milkType,
    Expression<String>? sugarLevel,
    Expression<String>? cupSize,
    Expression<String>? extras,
    Expression<double>? totalPrice,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (baseDrinkName != null) 'base_drink_name': baseDrinkName,
      if (baseDrinkPhoto != null) 'base_drink_photo': baseDrinkPhoto,
      if (milkType != null) 'milk_type': milkType,
      if (sugarLevel != null) 'sugar_level': sugarLevel,
      if (cupSize != null) 'cup_size': cupSize,
      if (extras != null) 'extras': extras,
      if (totalPrice != null) 'total_price': totalPrice,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  CustomDrinksTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? baseDrinkName,
    Value<String>? baseDrinkPhoto,
    Value<String>? milkType,
    Value<String>? sugarLevel,
    Value<String>? cupSize,
    Value<String>? extras,
    Value<double>? totalPrice,
    Value<DateTime>? createdAt,
  }) {
    return CustomDrinksTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      baseDrinkName: baseDrinkName ?? this.baseDrinkName,
      baseDrinkPhoto: baseDrinkPhoto ?? this.baseDrinkPhoto,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (baseDrinkName.present) {
      map['base_drink_name'] = Variable<String>(baseDrinkName.value);
    }
    if (baseDrinkPhoto.present) {
      map['base_drink_photo'] = Variable<String>(baseDrinkPhoto.value);
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
    return (StringBuffer('CustomDrinksTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('baseDrinkName: $baseDrinkName, ')
          ..write('baseDrinkPhoto: $baseDrinkPhoto, ')
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

class $DrinksTableTable extends DrinksTable
    with TableInfo<$DrinksTableTable, DrinksTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DrinksTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<int> calories = GeneratedColumn<int>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    description,
    image,
    price,
    category,
    calories,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'drinks_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<DrinksTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DrinksTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DrinksTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}calories'],
      )!,
    );
  }

  @override
  $DrinksTableTable createAlias(String alias) {
    return $DrinksTableTable(attachedDatabase, alias);
  }
}

class DrinksTableData extends DataClass implements Insertable<DrinksTableData> {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final String category;
  final int calories;
  const DrinksTableData({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.calories,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    map['price'] = Variable<double>(price);
    map['category'] = Variable<String>(category);
    map['calories'] = Variable<int>(calories);
    return map;
  }

  DrinksTableCompanion toCompanion(bool nullToAbsent) {
    return DrinksTableCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
      image: Value(image),
      price: Value(price),
      category: Value(category),
      calories: Value(calories),
    );
  }

  factory DrinksTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DrinksTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      price: serializer.fromJson<double>(json['price']),
      category: serializer.fromJson<String>(json['category']),
      calories: serializer.fromJson<int>(json['calories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'price': serializer.toJson<double>(price),
      'category': serializer.toJson<String>(category),
      'calories': serializer.toJson<int>(calories),
    };
  }

  DrinksTableData copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    double? price,
    String? category,
    int? calories,
  }) => DrinksTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
    image: image ?? this.image,
    price: price ?? this.price,
    category: category ?? this.category,
    calories: calories ?? this.calories,
  );
  DrinksTableData copyWithCompanion(DrinksTableCompanion data) {
    return DrinksTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      image: data.image.present ? data.image.value : this.image,
      price: data.price.present ? data.price.value : this.price,
      category: data.category.present ? data.category.value : this.category,
      calories: data.calories.present ? data.calories.value : this.calories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DrinksTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('category: $category, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, image, price, category, calories);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrinksTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.price == this.price &&
          other.category == this.category &&
          other.calories == this.calories);
}

class DrinksTableCompanion extends UpdateCompanion<DrinksTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<String> image;
  final Value<double> price;
  final Value<String> category;
  final Value<int> calories;
  const DrinksTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.price = const Value.absent(),
    this.category = const Value.absent(),
    this.calories = const Value.absent(),
  });
  DrinksTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String description,
    required String image,
    required double price,
    required String category,
    required int calories,
  }) : name = Value(name),
       description = Value(description),
       image = Value(image),
       price = Value(price),
       category = Value(category),
       calories = Value(calories);
  static Insertable<DrinksTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? image,
    Expression<double>? price,
    Expression<String>? category,
    Expression<int>? calories,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (price != null) 'price': price,
      if (category != null) 'category': category,
      if (calories != null) 'calories': calories,
    });
  }

  DrinksTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
    Value<String>? image,
    Value<double>? price,
    Value<String>? category,
    Value<int>? calories,
  }) {
    return DrinksTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      category: category ?? this.category,
      calories: calories ?? this.calories,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (calories.present) {
      map['calories'] = Variable<int>(calories.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DrinksTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('price: $price, ')
          ..write('category: $category, ')
          ..write('calories: $calories')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CustomDrinksTableTable customDrinksTable =
      $CustomDrinksTableTable(this);
  late final $DrinksTableTable drinksTable = $DrinksTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    customDrinksTable,
    drinksTable,
  ];
}

typedef $$CustomDrinksTableTableCreateCompanionBuilder =
    CustomDrinksTableCompanion Function({
      Value<int> id,
      required String name,
      required String baseDrinkName,
      required String baseDrinkPhoto,
      required String milkType,
      required String sugarLevel,
      required String cupSize,
      required String extras,
      required double totalPrice,
      required DateTime createdAt,
    });
typedef $$CustomDrinksTableTableUpdateCompanionBuilder =
    CustomDrinksTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> baseDrinkName,
      Value<String> baseDrinkPhoto,
      Value<String> milkType,
      Value<String> sugarLevel,
      Value<String> cupSize,
      Value<String> extras,
      Value<double> totalPrice,
      Value<DateTime> createdAt,
    });

class $$CustomDrinksTableTableFilterComposer
    extends Composer<_$AppDatabase, $CustomDrinksTableTable> {
  $$CustomDrinksTableTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseDrinkName => $composableBuilder(
    column: $table.baseDrinkName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get baseDrinkPhoto => $composableBuilder(
    column: $table.baseDrinkPhoto,
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

class $$CustomDrinksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomDrinksTableTable> {
  $$CustomDrinksTableTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseDrinkName => $composableBuilder(
    column: $table.baseDrinkName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get baseDrinkPhoto => $composableBuilder(
    column: $table.baseDrinkPhoto,
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

class $$CustomDrinksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomDrinksTableTable> {
  $$CustomDrinksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get baseDrinkName => $composableBuilder(
    column: $table.baseDrinkName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get baseDrinkPhoto => $composableBuilder(
    column: $table.baseDrinkPhoto,
    builder: (column) => column,
  );

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

class $$CustomDrinksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CustomDrinksTableTable,
          CustomDrinksTableData,
          $$CustomDrinksTableTableFilterComposer,
          $$CustomDrinksTableTableOrderingComposer,
          $$CustomDrinksTableTableAnnotationComposer,
          $$CustomDrinksTableTableCreateCompanionBuilder,
          $$CustomDrinksTableTableUpdateCompanionBuilder,
          (
            CustomDrinksTableData,
            BaseReferences<
              _$AppDatabase,
              $CustomDrinksTableTable,
              CustomDrinksTableData
            >,
          ),
          CustomDrinksTableData,
          PrefetchHooks Function()
        > {
  $$CustomDrinksTableTableTableManager(
    _$AppDatabase db,
    $CustomDrinksTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomDrinksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomDrinksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomDrinksTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> baseDrinkName = const Value.absent(),
                Value<String> baseDrinkPhoto = const Value.absent(),
                Value<String> milkType = const Value.absent(),
                Value<String> sugarLevel = const Value.absent(),
                Value<String> cupSize = const Value.absent(),
                Value<String> extras = const Value.absent(),
                Value<double> totalPrice = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => CustomDrinksTableCompanion(
                id: id,
                name: name,
                baseDrinkName: baseDrinkName,
                baseDrinkPhoto: baseDrinkPhoto,
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
                required String name,
                required String baseDrinkName,
                required String baseDrinkPhoto,
                required String milkType,
                required String sugarLevel,
                required String cupSize,
                required String extras,
                required double totalPrice,
                required DateTime createdAt,
              }) => CustomDrinksTableCompanion.insert(
                id: id,
                name: name,
                baseDrinkName: baseDrinkName,
                baseDrinkPhoto: baseDrinkPhoto,
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

typedef $$CustomDrinksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CustomDrinksTableTable,
      CustomDrinksTableData,
      $$CustomDrinksTableTableFilterComposer,
      $$CustomDrinksTableTableOrderingComposer,
      $$CustomDrinksTableTableAnnotationComposer,
      $$CustomDrinksTableTableCreateCompanionBuilder,
      $$CustomDrinksTableTableUpdateCompanionBuilder,
      (
        CustomDrinksTableData,
        BaseReferences<
          _$AppDatabase,
          $CustomDrinksTableTable,
          CustomDrinksTableData
        >,
      ),
      CustomDrinksTableData,
      PrefetchHooks Function()
    >;
typedef $$DrinksTableTableCreateCompanionBuilder =
    DrinksTableCompanion Function({
      Value<int> id,
      required String name,
      required String description,
      required String image,
      required double price,
      required String category,
      required int calories,
    });
typedef $$DrinksTableTableUpdateCompanionBuilder =
    DrinksTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<String> image,
      Value<double> price,
      Value<String> category,
      Value<int> calories,
    });

class $$DrinksTableTableFilterComposer
    extends Composer<_$AppDatabase, $DrinksTableTable> {
  $$DrinksTableTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DrinksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DrinksTableTable> {
  $$DrinksTableTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DrinksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DrinksTableTable> {
  $$DrinksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);
}

class $$DrinksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DrinksTableTable,
          DrinksTableData,
          $$DrinksTableTableFilterComposer,
          $$DrinksTableTableOrderingComposer,
          $$DrinksTableTableAnnotationComposer,
          $$DrinksTableTableCreateCompanionBuilder,
          $$DrinksTableTableUpdateCompanionBuilder,
          (
            DrinksTableData,
            BaseReferences<_$AppDatabase, $DrinksTableTable, DrinksTableData>,
          ),
          DrinksTableData,
          PrefetchHooks Function()
        > {
  $$DrinksTableTableTableManager(_$AppDatabase db, $DrinksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DrinksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DrinksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DrinksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> image = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<int> calories = const Value.absent(),
              }) => DrinksTableCompanion(
                id: id,
                name: name,
                description: description,
                image: image,
                price: price,
                category: category,
                calories: calories,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String description,
                required String image,
                required double price,
                required String category,
                required int calories,
              }) => DrinksTableCompanion.insert(
                id: id,
                name: name,
                description: description,
                image: image,
                price: price,
                category: category,
                calories: calories,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DrinksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DrinksTableTable,
      DrinksTableData,
      $$DrinksTableTableFilterComposer,
      $$DrinksTableTableOrderingComposer,
      $$DrinksTableTableAnnotationComposer,
      $$DrinksTableTableCreateCompanionBuilder,
      $$DrinksTableTableUpdateCompanionBuilder,
      (
        DrinksTableData,
        BaseReferences<_$AppDatabase, $DrinksTableTable, DrinksTableData>,
      ),
      DrinksTableData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CustomDrinksTableTableTableManager get customDrinksTable =>
      $$CustomDrinksTableTableTableManager(_db, _db.customDrinksTable);
  $$DrinksTableTableTableManager get drinksTable =>
      $$DrinksTableTableTableManager(_db, _db.drinksTable);
}
