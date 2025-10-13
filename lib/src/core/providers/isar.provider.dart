import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/core/db/isar.service.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  throw UnimplementedError('IsarService must be overridden in main()');
});

final isarDbProvider = Provider((ref) {
  return ref.watch(isarServiceProvider).db;
});
   