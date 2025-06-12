import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pattern_m/src/modules/dictionary/api/e2b.dictionary.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';

final meaningProvider =
    NotifierProvider<MeaningProvider, Translation?>(MeaningProvider.new);

class MeaningProvider extends Notifier<Translation?> {
  @override
  Translation? build() => null;

  Future<void> findMeaning(String word) async {
    final source = _removeSpecialCharacters(word);
    try {
      state = e2bDictionary.words.singleWhere((word) => word.en == source);
    } catch (e) {
      state = Translation(en: source, bn: source);
    }
  }

  String _removeSpecialCharacters(String word) {
    RegExp pattern = RegExp(r'^[^a-zA-Z0-9]+|[^a-zA-Z0-9]+$');
    return word.replaceAll(pattern, '');
  }
}
