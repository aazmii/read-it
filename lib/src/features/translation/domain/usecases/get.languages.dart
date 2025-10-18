import 'package:read_it/src/core/usecase/usecase.dart';
import 'package:read_it/src/features/translation/domain/entities/language.entity.dart';
import 'package:read_it/src/features/translation/domain/repositories/translation.repository.dart';

class GetLanguageUseCase implements AsyncUseCase<List<LanguageEntity>, void> {
  final TranslationRepository _translationRepository;

  GetLanguageUseCase(this._translationRepository);

  @override
  Future<List<LanguageEntity>> call({void p}) {
    return _translationRepository.getAvailableLanguages();
  }
}
// class GetRecentReadableFiles implements UseCase<List<ReadableFileEntity>, void> {
//   final PDFReaderRepository _isarReadableFileRepo;

//   GetRecentReadableFiles(this._isarReadableFileRepo);

//   @override
//   Future<List<ReadableFileEntity>> call({void p}) {
//     return _isarReadableFileRepo.getRecentFiles();
//   }
// }
