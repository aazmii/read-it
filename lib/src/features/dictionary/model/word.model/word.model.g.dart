// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordModelImpl _$$WordModelImplFromJson(Map<String, dynamic> json) =>
    _$WordModelImpl(
      word: json['word'] as String?,
      phonetic: json['phonetic'] as String?,
      origin: json['origin'] as String?,
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WordModelImplToJson(_$WordModelImpl instance) =>
    <String, dynamic>{
      'word': instance.word,
      'phonetic': instance.phonetic,
      'origin': instance.origin,
      'meanings': instance.meanings,
    };

_$MeaningImpl _$$MeaningImplFromJson(Map<String, dynamic> json) =>
    _$MeaningImpl(
      partOfSpeech: json['partOfSpeech'] as String?,
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MeaningImplToJson(_$MeaningImpl instance) =>
    <String, dynamic>{
      'partOfSpeech': instance.partOfSpeech,
      'definitions': instance.definitions,
    };

_$DefinitionImpl _$$DefinitionImplFromJson(Map<String, dynamic> json) =>
    _$DefinitionImpl(
      definition: json['definition'] as String?,
      example: json['example'] as String?,
      synonyms: (json['synonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      antonyms: (json['antonyms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$DefinitionImplToJson(_$DefinitionImpl instance) =>
    <String, dynamic>{
      'definition': instance.definition,
      'example': instance.example,
      'synonyms': instance.synonyms,
      'antonyms': instance.antonyms,
    };

_$PhoneticImpl _$$PhoneticImplFromJson(Map<String, dynamic> json) =>
    _$PhoneticImpl(
      text: json['text'] as String?,
      audio: json['audio'] as String?,
    );

Map<String, dynamic> _$$PhoneticImplToJson(_$PhoneticImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'audio': instance.audio,
    };
