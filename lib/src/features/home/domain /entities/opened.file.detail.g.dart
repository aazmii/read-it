// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opened.file.detail.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRecentFileCollection on Isar {
  IsarCollection<RecentFile> get recentFiles => this.collection();
}

const RecentFileSchema = CollectionSchema(
  name: r'RecentFile',
  id: 428040767606462206,
  properties: {
    r'fileData': PropertySchema(
      id: 0,
      name: r'fileData',
      type: IsarType.byteList,
    ),
    r'isLastOpened': PropertySchema(
      id: 1,
      name: r'isLastOpened',
      type: IsarType.bool,
    ),
    r'lastOpen': PropertySchema(
      id: 2,
      name: r'lastOpen',
      type: IsarType.dateTime,
    ),
    r'path': PropertySchema(
      id: 3,
      name: r'path',
      type: IsarType.string,
    )
  },
  estimateSize: _recentFileEstimateSize,
  serialize: _recentFileSerialize,
  deserialize: _recentFileDeserialize,
  deserializeProp: _recentFileDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _recentFileGetId,
  getLinks: _recentFileGetLinks,
  attach: _recentFileAttach,
  version: '3.1.0+1',
);

int _recentFileEstimateSize(
  RecentFile object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fileData;
    if (value != null) {
      bytesCount += 3 + value.length;
    }
  }
  {
    final value = object.path;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _recentFileSerialize(
  RecentFile object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByteList(offsets[0], object.fileData);
  writer.writeBool(offsets[1], object.isLastOpened);
  writer.writeDateTime(offsets[2], object.lastOpen);
  writer.writeString(offsets[3], object.path);
}

RecentFile _recentFileDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RecentFile(
    fileData: reader.readByteList(offsets[0]),
    isLastOpened: reader.readBoolOrNull(offsets[1]),
    lastOpen: reader.readDateTimeOrNull(offsets[2]),
    path: reader.readStringOrNull(offsets[3]),
  );
  object.id = id;
  return object;
}

P _recentFileDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readByteList(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _recentFileGetId(RecentFile object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _recentFileGetLinks(RecentFile object) {
  return [];
}

void _recentFileAttach(IsarCollection<dynamic> col, Id id, RecentFile object) {
  object.id = id;
}

extension RecentFileQueryWhereSort
    on QueryBuilder<RecentFile, RecentFile, QWhere> {
  QueryBuilder<RecentFile, RecentFile, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RecentFileQueryWhere
    on QueryBuilder<RecentFile, RecentFile, QWhereClause> {
  QueryBuilder<RecentFile, RecentFile, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<RecentFile, RecentFile, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterWhereClause> idBetween(
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

extension RecentFileQueryFilter
    on QueryBuilder<RecentFile, RecentFile, QFilterCondition> {
  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> fileDataIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fileData',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fileData',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fileData',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fileData',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fileData',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fileData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      fileDataLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'fileData',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> idBetween(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      isLastOpenedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isLastOpened',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      isLastOpenedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isLastOpened',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      isLastOpenedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isLastOpened',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> lastOpenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastOpen',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      lastOpenIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastOpen',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> lastOpenEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition>
      lastOpenGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> lastOpenLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastOpen',
        value: value,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> lastOpenBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastOpen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'path',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathEqualTo(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathGreaterThan(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathLessThan(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathBetween(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathStartsWith(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathEndsWith(
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

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'path',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'path',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'path',
        value: '',
      ));
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterFilterCondition> pathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'path',
        value: '',
      ));
    });
  }
}

extension RecentFileQueryObject
    on QueryBuilder<RecentFile, RecentFile, QFilterCondition> {}

extension RecentFileQueryLinks
    on QueryBuilder<RecentFile, RecentFile, QFilterCondition> {}

extension RecentFileQuerySortBy
    on QueryBuilder<RecentFile, RecentFile, QSortBy> {
  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> sortByIsLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> sortByIsLastOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.desc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> sortByLastOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> sortByLastOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.desc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> sortByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> sortByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension RecentFileQuerySortThenBy
    on QueryBuilder<RecentFile, RecentFile, QSortThenBy> {
  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByIsLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByIsLastOpenedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isLastOpened', Sort.desc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByLastOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByLastOpenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastOpen', Sort.desc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.asc);
    });
  }

  QueryBuilder<RecentFile, RecentFile, QAfterSortBy> thenByPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'path', Sort.desc);
    });
  }
}

extension RecentFileQueryWhereDistinct
    on QueryBuilder<RecentFile, RecentFile, QDistinct> {
  QueryBuilder<RecentFile, RecentFile, QDistinct> distinctByFileData() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fileData');
    });
  }

  QueryBuilder<RecentFile, RecentFile, QDistinct> distinctByIsLastOpened() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isLastOpened');
    });
  }

  QueryBuilder<RecentFile, RecentFile, QDistinct> distinctByLastOpen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastOpen');
    });
  }

  QueryBuilder<RecentFile, RecentFile, QDistinct> distinctByPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'path', caseSensitive: caseSensitive);
    });
  }
}

extension RecentFileQueryProperty
    on QueryBuilder<RecentFile, RecentFile, QQueryProperty> {
  QueryBuilder<RecentFile, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RecentFile, List<int>?, QQueryOperations> fileDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fileData');
    });
  }

  QueryBuilder<RecentFile, bool?, QQueryOperations> isLastOpenedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isLastOpened');
    });
  }

  QueryBuilder<RecentFile, DateTime?, QQueryOperations> lastOpenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastOpen');
    });
  }

  QueryBuilder<RecentFile, String?, QQueryOperations> pathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'path');
    });
  }
}
