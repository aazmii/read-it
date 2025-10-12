// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opened.file.detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReadableFileIsarCollection on Isar {
  IsarCollection<ReadableFileIsar> get readableFileIsars => this.collection();
}

const ReadableFileIsarSchema = CollectionSchema(
  name: r'ReadableFileIsar',
  id: -135622754576858179,
  properties: {
    r'fileSize': PropertySchema(
      id: 0,
      name: r'fileSize',
      type: IsarType.long,
    ),
    r'lastOpened': PropertySchema(
      id: 1,
      name: r'lastOpened',
      type: IsarType.dateTime,
    ),
    r'path': PropertySchema(
      id: 2,
      name: r'path',
      type: IsarType.string,
    )
  },
  estimateSize: _readableFileIsarEstimateSize,
  serialize: _readableFileIsarSerialize,
  deserialize: _readableFileIsarDeserialize,
  deserializeProp: _readableFileIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _readableFileIsarGetId,
  getLinks: _readableFileIsarGetLinks,
  attach: _readableFileIsarAttach,
  version: '3.1.0+1',
);

int _readableFileIsarEstimateSize(
  ReadableFileIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _readableFileIsarSerialize(
  ReadableFileIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.fileSize);
  writer.writeDateTime(offsets[1], object.lastOpened);
  writer.writeString(offsets[2], object.path);
}

ReadableFileIsar _readableFileIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReadableFileIsar(
    fileSize: reader.readLongOrNull(offsets[0]),
    lastOpened: reader.readDateTimeOrNull(offsets[1]),
    path: reader.readStringOrNull(offsets[2]),
  );
  object.id = id;
  return object;
}

P _readableFileIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _readableFileIsarGetId(ReadableFileIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _readableFileIsarGetLinks(ReadableFileIsar object) {
  return [];
}

void _readableFileIsarAttach(
    IsarCollection<dynamic> col, Id id, ReadableFileIsar object) {
  object.id = id;
}

extension ReadableFileIsarQueryWhereSort
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QWhere> {
  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ReadableFileIsarQueryWhere
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QWhereClause> {
  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ReadableFileIsarQueryFilter
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QFilterCondition> {
  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      fileSizeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileSize',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      fileSizeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileSize',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      fileSizeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      fileSizeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      fileSizeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileSize',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      fileSizeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileSize',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      lastOpenedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastOpened',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      lastOpenedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastOpened',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      lastOpenedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastOpened',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      lastOpenedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastOpened',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      lastOpenedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastOpened',
        value: value,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      lastOpenedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastOpened',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'path',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterFilterCondition>
      pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path',
        value: '',
      ));
    });
  }
}

extension ReadableFileIsarQueryObject
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QFilterCondition> {}

extension ReadableFileIsarQueryLinks
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QFilterCondition> {}

extension ReadableFileIsarQuerySortBy
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QSortBy> {
  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      sortByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      sortByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      sortByLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpened', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      sortByLastOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpened', Sort.desc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy> sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension ReadableFileIsarQuerySortThenBy
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QSortThenBy> {
  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      thenByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      thenByFileSizeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fileSize', Sort.desc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      thenByLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpened', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      thenByLastOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpened', Sort.desc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy> thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QAfterSortBy>
      thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension ReadableFileIsarQueryWhereDistinct
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QDistinct> {
  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QDistinct>
      distinctByFileSize() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileSize');
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QDistinct>
      distinctByLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastOpened');
    });
  }

  QueryBuilder<ReadableFileIsar, ReadableFileIsar, QDistinct> distinctByPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }
}

extension ReadableFileIsarQueryProperty
    on QueryBuilder<ReadableFileIsar, ReadableFileIsar, QQueryProperty> {
  QueryBuilder<ReadableFileIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReadableFileIsar, int?, QQueryOperations> fileSizeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileSize');
    });
  }

  QueryBuilder<ReadableFileIsar, DateTime?, QQueryOperations>
      lastOpenedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastOpened');
    });
  }

  QueryBuilder<ReadableFileIsar, String?, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }
}
