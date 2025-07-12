import 'package:freezed_annotation/freezed_annotation.dart';
part 'word.model.freezed.dart';
part 'word.model.g.dart';

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    String? word,
    String? phonetic,
    String? origin,
    List<Meaning>? meanings,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);
}

@freezed
class Meaning with _$Meaning {
  const factory Meaning({
    String? partOfSpeech,
    List<Definition>? definitions,
  }) = _Meaning;

  factory Meaning.fromJson(Map<String, dynamic> json) => _$MeaningFromJson(json);
}

@freezed
class Definition with _$Definition {
  const factory Definition({
    String? definition,
    String? example,
    List<String>? synonyms,
    List<String>? antonyms,
  }) = _Definition;

  factory Definition.fromJson(Map<String, dynamic> json) => _$DefinitionFromJson(json);
}

@freezed
class Phonetic with _$Phonetic {
  const factory Phonetic({
    String? text,
    String? audio,
  }) = _Phonetic;

  factory Phonetic.fromJson(Map<String, dynamic> json) => _$PhoneticFromJson(json);
}
