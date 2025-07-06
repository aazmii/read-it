// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  String? get word => throw _privateConstructorUsedError;
  String? get phonetic => throw _privateConstructorUsedError;
  String? get origin => throw _privateConstructorUsedError;
  List<Meaning>? get meanings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordModelCopyWith<WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call(
      {String? word,
      String? phonetic,
      String? origin,
      List<Meaning>? meanings});
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? phonetic = freezed,
    Object? origin = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_value.copyWith(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      phonetic: freezed == phonetic
          ? _value.phonetic
          : phonetic // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      meanings: freezed == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordModelImplCopyWith<$Res>
    implements $WordModelCopyWith<$Res> {
  factory _$$WordModelImplCopyWith(
          _$WordModelImpl value, $Res Function(_$WordModelImpl) then) =
      __$$WordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? word,
      String? phonetic,
      String? origin,
      List<Meaning>? meanings});
}

/// @nodoc
class __$$WordModelImplCopyWithImpl<$Res>
    extends _$WordModelCopyWithImpl<$Res, _$WordModelImpl>
    implements _$$WordModelImplCopyWith<$Res> {
  __$$WordModelImplCopyWithImpl(
      _$WordModelImpl _value, $Res Function(_$WordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = freezed,
    Object? phonetic = freezed,
    Object? origin = freezed,
    Object? meanings = freezed,
  }) {
    return _then(_$WordModelImpl(
      word: freezed == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String?,
      phonetic: freezed == phonetic
          ? _value.phonetic
          : phonetic // ignore: cast_nullable_to_non_nullable
              as String?,
      origin: freezed == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String?,
      meanings: freezed == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordModelImpl implements _WordModel {
  const _$WordModelImpl(
      {this.word, this.phonetic, this.origin, final List<Meaning>? meanings})
      : _meanings = meanings;

  factory _$WordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordModelImplFromJson(json);

  @override
  final String? word;
  @override
  final String? phonetic;
  @override
  final String? origin;
  final List<Meaning>? _meanings;
  @override
  List<Meaning>? get meanings {
    final value = _meanings;
    if (value == null) return null;
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WordModel(word: $word, phonetic: $phonetic, origin: $origin, meanings: $meanings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordModelImpl &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.phonetic, phonetic) ||
                other.phonetic == phonetic) &&
            (identical(other.origin, origin) || other.origin == origin) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, word, phonetic, origin,
      const DeepCollectionEquality().hash(_meanings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      __$$WordModelImplCopyWithImpl<_$WordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordModelImplToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {final String? word,
      final String? phonetic,
      final String? origin,
      final List<Meaning>? meanings}) = _$WordModelImpl;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$WordModelImpl.fromJson;

  @override
  String? get word;
  @override
  String? get phonetic;
  @override
  String? get origin;
  @override
  List<Meaning>? get meanings;
  @override
  @JsonKey(ignore: true)
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meaning _$MeaningFromJson(Map<String, dynamic> json) {
  return _Meaning.fromJson(json);
}

/// @nodoc
mixin _$Meaning {
  String? get partsOfSpeech => throw _privateConstructorUsedError;
  List<Definition>? get definitions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MeaningCopyWith<Meaning> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeaningCopyWith<$Res> {
  factory $MeaningCopyWith(Meaning value, $Res Function(Meaning) then) =
      _$MeaningCopyWithImpl<$Res, Meaning>;
  @useResult
  $Res call({String? partsOfSpeech, List<Definition>? definitions});
}

/// @nodoc
class _$MeaningCopyWithImpl<$Res, $Val extends Meaning>
    implements $MeaningCopyWith<$Res> {
  _$MeaningCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsOfSpeech = freezed,
    Object? definitions = freezed,
  }) {
    return _then(_value.copyWith(
      partsOfSpeech: freezed == partsOfSpeech
          ? _value.partsOfSpeech
          : partsOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      definitions: freezed == definitions
          ? _value.definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeaningImplCopyWith<$Res> implements $MeaningCopyWith<$Res> {
  factory _$$MeaningImplCopyWith(
          _$MeaningImpl value, $Res Function(_$MeaningImpl) then) =
      __$$MeaningImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? partsOfSpeech, List<Definition>? definitions});
}

/// @nodoc
class __$$MeaningImplCopyWithImpl<$Res>
    extends _$MeaningCopyWithImpl<$Res, _$MeaningImpl>
    implements _$$MeaningImplCopyWith<$Res> {
  __$$MeaningImplCopyWithImpl(
      _$MeaningImpl _value, $Res Function(_$MeaningImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partsOfSpeech = freezed,
    Object? definitions = freezed,
  }) {
    return _then(_$MeaningImpl(
      partsOfSpeech: freezed == partsOfSpeech
          ? _value.partsOfSpeech
          : partsOfSpeech // ignore: cast_nullable_to_non_nullable
              as String?,
      definitions: freezed == definitions
          ? _value._definitions
          : definitions // ignore: cast_nullable_to_non_nullable
              as List<Definition>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeaningImpl implements _Meaning {
  const _$MeaningImpl({this.partsOfSpeech, final List<Definition>? definitions})
      : _definitions = definitions;

  factory _$MeaningImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeaningImplFromJson(json);

  @override
  final String? partsOfSpeech;
  final List<Definition>? _definitions;
  @override
  List<Definition>? get definitions {
    final value = _definitions;
    if (value == null) return null;
    if (_definitions is EqualUnmodifiableListView) return _definitions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Meaning(partsOfSpeech: $partsOfSpeech, definitions: $definitions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeaningImpl &&
            (identical(other.partsOfSpeech, partsOfSpeech) ||
                other.partsOfSpeech == partsOfSpeech) &&
            const DeepCollectionEquality()
                .equals(other._definitions, _definitions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partsOfSpeech,
      const DeepCollectionEquality().hash(_definitions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MeaningImplCopyWith<_$MeaningImpl> get copyWith =>
      __$$MeaningImplCopyWithImpl<_$MeaningImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeaningImplToJson(
      this,
    );
  }
}

abstract class _Meaning implements Meaning {
  const factory _Meaning(
      {final String? partsOfSpeech,
      final List<Definition>? definitions}) = _$MeaningImpl;

  factory _Meaning.fromJson(Map<String, dynamic> json) = _$MeaningImpl.fromJson;

  @override
  String? get partsOfSpeech;
  @override
  List<Definition>? get definitions;
  @override
  @JsonKey(ignore: true)
  _$$MeaningImplCopyWith<_$MeaningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$Definition {
  String? get definition => throw _privateConstructorUsedError;
  String? get example => throw _privateConstructorUsedError;
  List<String>? get synonyms => throw _privateConstructorUsedError;
  List<String>? get antonyms => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) then) =
      _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call(
      {String? definition,
      String? example,
      List<String>? synonyms,
      List<String>? antonyms});
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? example = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
  }) {
    return _then(_value.copyWith(
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
      synonyms: freezed == synonyms
          ? _value.synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      antonyms: freezed == antonyms
          ? _value.antonyms
          : antonyms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefinitionImplCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$DefinitionImplCopyWith(
          _$DefinitionImpl value, $Res Function(_$DefinitionImpl) then) =
      __$$DefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? definition,
      String? example,
      List<String>? synonyms,
      List<String>? antonyms});
}

/// @nodoc
class __$$DefinitionImplCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$DefinitionImpl>
    implements _$$DefinitionImplCopyWith<$Res> {
  __$$DefinitionImplCopyWithImpl(
      _$DefinitionImpl _value, $Res Function(_$DefinitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = freezed,
    Object? example = freezed,
    Object? synonyms = freezed,
    Object? antonyms = freezed,
  }) {
    return _then(_$DefinitionImpl(
      definition: freezed == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String?,
      example: freezed == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String?,
      synonyms: freezed == synonyms
          ? _value._synonyms
          : synonyms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      antonyms: freezed == antonyms
          ? _value._antonyms
          : antonyms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefinitionImpl implements _Definition {
  const _$DefinitionImpl(
      {this.definition,
      this.example,
      final List<String>? synonyms,
      final List<String>? antonyms})
      : _synonyms = synonyms,
        _antonyms = antonyms;

  factory _$DefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefinitionImplFromJson(json);

  @override
  final String? definition;
  @override
  final String? example;
  final List<String>? _synonyms;
  @override
  List<String>? get synonyms {
    final value = _synonyms;
    if (value == null) return null;
    if (_synonyms is EqualUnmodifiableListView) return _synonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _antonyms;
  @override
  List<String>? get antonyms {
    final value = _antonyms;
    if (value == null) return null;
    if (_antonyms is EqualUnmodifiableListView) return _antonyms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Definition(definition: $definition, example: $example, synonyms: $synonyms, antonyms: $antonyms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionImpl &&
            (identical(other.definition, definition) ||
                other.definition == definition) &&
            (identical(other.example, example) || other.example == example) &&
            const DeepCollectionEquality().equals(other._synonyms, _synonyms) &&
            const DeepCollectionEquality().equals(other._antonyms, _antonyms));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      definition,
      example,
      const DeepCollectionEquality().hash(_synonyms),
      const DeepCollectionEquality().hash(_antonyms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      __$$DefinitionImplCopyWithImpl<_$DefinitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefinitionImplToJson(
      this,
    );
  }
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {final String? definition,
      final String? example,
      final List<String>? synonyms,
      final List<String>? antonyms}) = _$DefinitionImpl;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$DefinitionImpl.fromJson;

  @override
  String? get definition;
  @override
  String? get example;
  @override
  List<String>? get synonyms;
  @override
  List<String>? get antonyms;
  @override
  @JsonKey(ignore: true)
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Phonetic _$PhoneticFromJson(Map<String, dynamic> json) {
  return _Phonetic.fromJson(json);
}

/// @nodoc
mixin _$Phonetic {
  String? get text => throw _privateConstructorUsedError;
  String? get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneticCopyWith<Phonetic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneticCopyWith<$Res> {
  factory $PhoneticCopyWith(Phonetic value, $Res Function(Phonetic) then) =
      _$PhoneticCopyWithImpl<$Res, Phonetic>;
  @useResult
  $Res call({String? text, String? audio});
}

/// @nodoc
class _$PhoneticCopyWithImpl<$Res, $Val extends Phonetic>
    implements $PhoneticCopyWith<$Res> {
  _$PhoneticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? audio = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneticImplCopyWith<$Res>
    implements $PhoneticCopyWith<$Res> {
  factory _$$PhoneticImplCopyWith(
          _$PhoneticImpl value, $Res Function(_$PhoneticImpl) then) =
      __$$PhoneticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? audio});
}

/// @nodoc
class __$$PhoneticImplCopyWithImpl<$Res>
    extends _$PhoneticCopyWithImpl<$Res, _$PhoneticImpl>
    implements _$$PhoneticImplCopyWith<$Res> {
  __$$PhoneticImplCopyWithImpl(
      _$PhoneticImpl _value, $Res Function(_$PhoneticImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? audio = freezed,
  }) {
    return _then(_$PhoneticImpl(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneticImpl implements _Phonetic {
  const _$PhoneticImpl({this.text, this.audio});

  factory _$PhoneticImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneticImplFromJson(json);

  @override
  final String? text;
  @override
  final String? audio;

  @override
  String toString() {
    return 'Phonetic(text: $text, audio: $audio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneticImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneticImplCopyWith<_$PhoneticImpl> get copyWith =>
      __$$PhoneticImplCopyWithImpl<_$PhoneticImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneticImplToJson(
      this,
    );
  }
}

abstract class _Phonetic implements Phonetic {
  const factory _Phonetic({final String? text, final String? audio}) =
      _$PhoneticImpl;

  factory _Phonetic.fromJson(Map<String, dynamic> json) =
      _$PhoneticImpl.fromJson;

  @override
  String? get text;
  @override
  String? get audio;
  @override
  @JsonKey(ignore: true)
  _$$PhoneticImplCopyWith<_$PhoneticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
