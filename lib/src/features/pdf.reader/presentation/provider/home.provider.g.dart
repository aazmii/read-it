// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storageFilesHash() => r'c268d76bb7308ac48df5dfe6df2ec8b8d815220d';

/// See also [StorageFiles].
@ProviderFor(StorageFiles)
final storageFilesProvider =
    AutoDisposeAsyncNotifierProvider<StorageFiles, List<ReadableFile>>.internal(
  StorageFiles.new,
  name: r'storageFilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$storageFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StorageFiles = AutoDisposeAsyncNotifier<List<ReadableFile>>;
String _$recentFilesHash() => r'4b53bfe2c4f5e2dfef91f97f7552d8463b4a4b8f';

/// See also [RecentFiles].
@ProviderFor(RecentFiles)
final recentFilesProvider =
    AutoDisposeAsyncNotifierProvider<RecentFiles, List<ReadableFile>>.internal(
  RecentFiles.new,
  name: r'recentFilesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$recentFilesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentFiles = AutoDisposeAsyncNotifier<List<ReadableFile>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
