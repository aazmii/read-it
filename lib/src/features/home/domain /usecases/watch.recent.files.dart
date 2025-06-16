import 'package:pattern_m/src/features/home/domain%20/entities/opened.file.detail.dart';
import 'package:pattern_m/src/features/home/domain%20/repositories/recent.pdf.repository.dart';

class WatchRecentFiles {
  final RecentFileRepository repository;

  WatchRecentFiles(this.repository);

  Stream<List<RecentFile>> call() {
    return repository.watchRecentFiles();
  }
}
