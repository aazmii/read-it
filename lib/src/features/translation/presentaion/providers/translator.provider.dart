import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:read_it/src/features/translation/data/repository/translation.repo.impl.dart';
import 'package:read_it/src/features/translation/domain/repositories/translation.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'translator.provider.g.dart';

@riverpod
class Translator extends _$Translator {
  late final TranslationRepository repo;
  @override
  OnDeviceTranslator build() {
    repo = TranslationRepositoryImpl();

    /// TODO: take from settings
    return OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.french,
    );
  }

  Future<String?> translateText(String text) async {
    return repo.translateText(state, text);
  }
}

extension OnDeviceTranslatorX on OnDeviceTranslator {
  OnDeviceTranslator withSource(TranslateLanguage newSource) {
    return OnDeviceTranslator(
      sourceLanguage: newSource,
      targetLanguage: targetLanguage,
    );
  }

  OnDeviceTranslator withTarget(TranslateLanguage newTarget) {
    return OnDeviceTranslator(
      sourceLanguage: sourceLanguage,
      targetLanguage: newTarget,
    );
  }
}
