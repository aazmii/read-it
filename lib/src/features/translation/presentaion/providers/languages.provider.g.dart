// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$languagesHash() => r'4078458b9c71f34a660dc9be3a2b6bc9559b5a11';

/// Provides list of available languages than can be translated
/// and provides methods to download and delete languages
///
/// Copied from [Languages].
@ProviderFor(Languages)
final languagesProvider =
    AutoDisposeAsyncNotifierProvider<Languages, List<LanguageEntity>>.internal(
  Languages.new,
  name: r'languagesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$languagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Languages = AutoDisposeAsyncNotifier<List<LanguageEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
