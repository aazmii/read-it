import 'package:pattern_m/src/features/home/domain%20/entities/opened.file.detail.dart';

abstract class PdfRepository {
  Future<List<RecentFile>> getAllPdfs();
}

abstract class RecentFileRepository {
  Stream<List<RecentFile>> watchRecentFiles();
  // Future<List<RecentFile>> getRecentPdfs();
  // Future<void> saveRecent(RecentFile file);
  // Future<void> updateRecent(RecentFile file);
}
