import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/db/isar.dart';
import 'package:pattern_m/src/features/home/data/repositories/recent.file.repo.impl.dart';
import 'package:pattern_m/src/features/home/domain%20/repositories/recent.pdf.repository.dart';

// final recentFilesStreamProvider = StreamProvider.autoDispose<List<RecentFile>>((ref) {
//   final usecase = ref.watch(_watchRecentFilesProvider);
//   return usecase();
// });

// final _watchRecentFilesProvider = Provider<WatchRecentFiles>((ref) {
//   final repo = ref.watch(recentFileRepositoryProvider);
//   return WatchRecentFiles(repo);
// });

// final appDatabaseProvider = Provider((ref) => db);

final recentFileRepositoryProvider = Provider<RecentFileRepository>(
  (ref) => RecentFileRepositoryImpl(db),
);
