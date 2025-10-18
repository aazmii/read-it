import 'package:read_it/src/features/translation/data/repository/translation.repo.impl.dart';
import 'package:read_it/src/features/translation/domain/entities/language.entity.dart';
import 'package:read_it/src/features/translation/domain/repositories/translation.repository.dart';
import 'package:read_it/src/features/translation/domain/usecases/get.languages.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'languages.provider.g.dart';

/// Provides list of available languages than can be translated
/// and provides methods to download and delete languages
@riverpod
class Languages extends _$Languages {
  late final TranslationRepository repo;
  @override
  Future<List<LanguageEntity>> build() async {
    repo = TranslationRepositoryImpl();
    return await GetLanguageUseCase(repo).call();
  }

  Future<bool> downloadLanguage(String code) async {
    try {
      final isDownloaded = await repo.downloadLanguage(code);
      if (isDownloaded) {
        // UPDATE VALUE IN STATE
        final updatedList = state.value?.map((e) => e.code == code ? e.copyWith(isDownloaded: true) : e).toList() ?? [];
        state = AsyncData(updatedList);
      }
      return isDownloaded;
    } catch (e) {
      return false;
    }
  }

  Future<bool> deleteLanguage(String code) async {
    final isDeleted = await repo.deleteLanguage(code);
    if (isDeleted) {
      // UPDATE VALUE IN STATE
      final updatedList = state.value?.map((e) => e.code == code ? e.copyWith(isDownloaded: false) : e).toList() ?? [];
      state = AsyncData(updatedList);
    }
    return isDeleted;
  }


}


// /// Provides repo for reusing single instance
// final _translationRepoProvider = Provider<TranslationRepository>((ref) {
//   return TranslationRepositoryImpl();
// });
