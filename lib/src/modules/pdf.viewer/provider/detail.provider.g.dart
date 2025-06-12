// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedPDFHash() => r'a509c4ca566dc58cdbb02b5904f1ccb21dae12ff';

/// See also [SelectedPDF].
@ProviderFor(SelectedPDF)
final selectedPDFProvider = NotifierProvider<SelectedPDF, File?>.internal(
  SelectedPDF.new,
  name: r'selectedPDFProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selectedPDFHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedPDF = Notifier<File?>;
String _$loadingHash() => r'7dbd4e60e09c4e1a7f1a8922cbd61f88f9725597';

/// See also [Loading].
@ProviderFor(Loading)
final loadingProvider = AutoDisposeNotifierProvider<Loading, bool>.internal(
  Loading.new,
  name: r'loadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Loading = AutoDisposeNotifier<bool>;
String _$readModeHash() => r'f21ff293d7690eb92b92e9c94d1ae700691cf6b7';

/// See also [ReadMode].
@ProviderFor(ReadMode)
final readModeProvider = AutoDisposeNotifierProvider<ReadMode, Mode>.internal(
  ReadMode.new,
  name: r'readModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$readModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ReadMode = AutoDisposeNotifier<Mode>;
String _$pageNumHash() => r'774b55ba4ab5edf4234c87cd81084ec2375f3042';

/// See also [PageNum].
@ProviderFor(PageNum)
final pageNumProvider = AutoDisposeNotifierProvider<PageNum, int>.internal(
  PageNum.new,
  name: r'pageNumProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pageNumHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PageNum = AutoDisposeNotifier<int>;
String _$plainTextHash() => r'010604dbf7f085d2638cd9df0911acd33831713b';

/// See also [PlainText].
@ProviderFor(PlainText)
final plainTextProvider =
    AutoDisposeAsyncNotifierProvider<PlainText, String?>.internal(
  PlainText.new,
  name: r'plainTextProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$plainTextHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlainText = AutoDisposeAsyncNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
