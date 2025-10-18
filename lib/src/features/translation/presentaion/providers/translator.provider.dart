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
    final link = ref.keepAlive(); // KEEPS ALIVE THE TRANSLATOR
    repo = TranslationRepositoryImpl();
    final translator = OnDeviceTranslator(
      sourceLanguage: TranslateLanguage.english,
      targetLanguage: TranslateLanguage.french,
    );
    ref.onDispose(() {
      translator.close();
      link.close();
    });
    return translator;
  }

  Future<String?> translate(String text) async {
    return await repo.translateText(state, text);
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
