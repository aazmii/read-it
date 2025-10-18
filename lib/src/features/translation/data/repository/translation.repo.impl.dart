import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:read_it/src/features/translation/domain/entities/language.entity.dart';

import '../../domain/repositories/translation.repository.dart';

class TranslationRepositoryImpl implements TranslationRepository {
  final _modelManager = OnDeviceTranslatorModelManager();
  @override
  Future<List<LanguageEntity>> getAvailableLanguages() async {
    final languages = await Future.wait(
      TranslateLanguage.values.map((t) async {
        final isDownloaded = await _modelManager.isModelDownloaded(t.bcpCode);
        return LanguageEntity(name: t.name, code: t.bcpCode, isDownloaded: isDownloaded);
      }),
    );
    return languages;
  }
}
