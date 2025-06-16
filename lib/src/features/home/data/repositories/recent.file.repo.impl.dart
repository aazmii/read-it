import 'package:isar/isar.dart';
import 'package:pattern_m/src/features/home/domain%20/entities/opened.file.detail.dart';
import 'package:pattern_m/src/features/home/domain%20/repositories/recent.pdf.repository.dart';

class RecentFileRepositoryImpl implements RecentFileRepository {
  final Isar db;
  RecentFileRepositoryImpl(this.db);
  @override
  Stream<List<RecentFile>> watchRecentFiles() {
    return db.recentFiles.watchLazy(fireImmediately: true).asyncMap((_) => db.recentFiles.where().findAll());
  }
}
