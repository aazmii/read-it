import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/features/translation/data/repository/translation.repo.impl.dart';
import 'package:read_it/src/features/translation/domain/repositories/translation.repository.dart';
import 'package:read_it/src/features/translation/domain/usecases/get.languages.dart';

/// This might turned into class
final availableLanguagesProvider = FutureProvider.autoDispose((ref) {
  final repo = ref.watch(translationRepoProvider);
  return GetLanguageUseCase(repo).call();
});

/// Provides repo for reusing single instance
final translationRepoProvider = Provider<TranslationRepository>((ref) {
  return TranslationRepositoryImpl();
});
