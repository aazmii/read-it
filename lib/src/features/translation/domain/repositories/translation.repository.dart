import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:read_it/src/features/translation/domain/entities/language.entity.dart';

abstract class TranslationRepository {
  Future<List<LanguageEntity>> getAvailableLanguages();
  Future<bool> downloadLanguage(String code);
  Future<bool> deleteLanguage(String code);
  Future<String?> translateText(OnDeviceTranslator translator, String text);
  
  
}
