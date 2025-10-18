import 'package:google_mlkit_translation/google_mlkit_translation.dart';

class TranslationManager {
  final _modelManager = OnDeviceTranslatorModelManager();
  getAvailableLanguages() => TranslateLanguage.values;
}
