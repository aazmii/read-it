import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'word.meaning.dart';

class E2BDictionary {
  final List<Translation> words;
  E2BDictionary({required this.words});

  E2BDictionary copyWith({List<Translation>? words}) {
    return E2BDictionary(words: words ?? this.words);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'words': words.map((x) => x.toMap()).toList(),
    };
  }

  factory E2BDictionary.fromMap(Map<String, dynamic> map) {
    return E2BDictionary(
      words: (map['words'] as List).map((e) => Translation.fromMap(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory E2BDictionary.fromJson(String source) => E2BDictionary.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'E2BDictionary(words: $words)';

  @override
  bool operator ==(covariant E2BDictionary other) {
    if (identical(this, other)) return true;

    return listEquals(other.words, words);
  }

  @override
  int get hashCode => words.hashCode;
}
