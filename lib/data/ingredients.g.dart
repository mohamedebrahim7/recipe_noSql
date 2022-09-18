// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredients.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetIngredientsCollection on Isar {
  IsarCollection<Ingredients> get ingredientss => getCollection();
}

const IngredientsSchema = CollectionSchema(
  name: 'Ingredients',
  schema:
      '{"name":"Ingredients","idName":"id","properties":[{"name":"name","type":"String"},{"name":"weight","type":"Double"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'name': 0, 'weight': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _ingredientsGetId,
  setId: _ingredientsSetId,
  getLinks: _ingredientsGetLinks,
  attachLinks: _ingredientsAttachLinks,
  serializeNative: _ingredientsSerializeNative,
  deserializeNative: _ingredientsDeserializeNative,
  deserializePropNative: _ingredientsDeserializePropNative,
  serializeWeb: _ingredientsSerializeWeb,
  deserializeWeb: _ingredientsDeserializeWeb,
  deserializePropWeb: _ingredientsDeserializePropWeb,
  version: 3,
);

int? _ingredientsGetId(Ingredients object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _ingredientsSetId(Ingredients object, int id) {
  object.id = id;
}

List<IsarLinkBase> _ingredientsGetLinks(Ingredients object) {
  return [];
}

void _ingredientsSerializeNative(
    IsarCollection<Ingredients> collection,
    IsarRawObject rawObj,
    Ingredients object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_name.length) as int;
  final value1 = object.weight;
  final _weight = value1;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _name);
  writer.writeDouble(offsets[1], _weight);
}

Ingredients _ingredientsDeserializeNative(
    IsarCollection<Ingredients> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = Ingredients();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  object.weight = reader.readDouble(offsets[1]);
  return object;
}

P _ingredientsDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _ingredientsSerializeWeb(
    IsarCollection<Ingredients> collection, Ingredients object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  IsarNative.jsObjectSet(jsObj, 'weight', object.weight);
  return jsObj;
}

Ingredients _ingredientsDeserializeWeb(
    IsarCollection<Ingredients> collection, dynamic jsObj) {
  final object = Ingredients();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.name = IsarNative.jsObjectGet(jsObj, 'name') ?? '';
  object.weight =
      IsarNative.jsObjectGet(jsObj, 'weight') ?? double.negativeInfinity;
  return object;
}

P _ingredientsDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    case 'weight':
      return (IsarNative.jsObjectGet(jsObj, 'weight') ??
          double.negativeInfinity) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _ingredientsAttachLinks(IsarCollection col, int id, Ingredients object) {}

extension IngredientsQueryWhereSort
    on QueryBuilder<Ingredients, Ingredients, QWhere> {
  QueryBuilder<Ingredients, Ingredients, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension IngredientsQueryWhere
    on QueryBuilder<Ingredients, Ingredients, QWhereClause> {
  QueryBuilder<Ingredients, Ingredients, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Ingredients, Ingredients, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Ingredients, Ingredients, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Ingredients, Ingredients, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension IngredientsQueryFilter
    on QueryBuilder<Ingredients, Ingredients, QFilterCondition> {
  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition>
      weightGreaterThan(double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: false,
      property: 'weight',
      value: value,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> weightLessThan(
      double value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: false,
      property: 'weight',
      value: value,
    ));
  }

  QueryBuilder<Ingredients, Ingredients, QAfterFilterCondition> weightBetween(
      double lower, double upper) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'weight',
      lower: lower,
      includeLower: false,
      upper: upper,
      includeUpper: false,
    ));
  }
}

extension IngredientsQueryLinks
    on QueryBuilder<Ingredients, Ingredients, QFilterCondition> {}

extension IngredientsQueryWhereSortBy
    on QueryBuilder<Ingredients, Ingredients, QSortBy> {
  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> sortByWeight() {
    return addSortByInternal('weight', Sort.asc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> sortByWeightDesc() {
    return addSortByInternal('weight', Sort.desc);
  }
}

extension IngredientsQueryWhereSortThenBy
    on QueryBuilder<Ingredients, Ingredients, QSortThenBy> {
  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> thenByWeight() {
    return addSortByInternal('weight', Sort.asc);
  }

  QueryBuilder<Ingredients, Ingredients, QAfterSortBy> thenByWeightDesc() {
    return addSortByInternal('weight', Sort.desc);
  }
}

extension IngredientsQueryWhereDistinct
    on QueryBuilder<Ingredients, Ingredients, QDistinct> {
  QueryBuilder<Ingredients, Ingredients, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Ingredients, Ingredients, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }

  QueryBuilder<Ingredients, Ingredients, QDistinct> distinctByWeight() {
    return addDistinctByInternal('weight');
  }
}

extension IngredientsQueryProperty
    on QueryBuilder<Ingredients, Ingredients, QQueryProperty> {
  QueryBuilder<Ingredients, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Ingredients, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }

  QueryBuilder<Ingredients, double, QQueryOperations> weightProperty() {
    return addPropertyNameInternal('weight');
  }
}
