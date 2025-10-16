// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storageFilesHash() => r'66bfe4b37ccbc17d6cc573fdb687cdae22cf03ca';

/// See also [StorageFiles].
@ProviderFor(StorageFiles)
final storageFilesProvider = AutoDisposeAsyncNotifierProvider<StorageFiles,
    List<ReadableFileEntity>>.internal(
  StorageFiles.new,
  name: r'storageFilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storageFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StorageFiles = AutoDisposeAsyncNotifier<List<ReadableFileEntity>>;
String _$recentFilesHash() => r'760428c9b3cd5dd49a8905f0fc28c2ad63a89886';

/// See also [RecentFiles].
@ProviderFor(RecentFiles)
final recentFilesProvider = AutoDisposeAsyncNotifierProvider<RecentFiles,
    List<ReadableFileEntity>>.internal(
  RecentFiles.new,
  name: r'recentFilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recentFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentFiles = AutoDisposeAsyncNotifier<List<ReadableFileEntity>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
