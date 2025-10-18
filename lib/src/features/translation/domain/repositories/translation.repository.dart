import 'package:read_it/src/features/translation/domain/entities/language.entity.dart';

abstract class TranslationRepository {
  Future<List<LanguageEntity>> getAvailableLanguages();
}
