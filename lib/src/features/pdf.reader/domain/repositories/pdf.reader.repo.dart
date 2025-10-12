import '../entities/readable.file.dart';

abstract class IsarReadableFileRepo {
  Stream<List<ReadableFile>> watchRecentFiles();
  Future<List<ReadableFile>> scanForReadableFiles();
  Future<List<ReadableFile>> getRecentFiles();
  Future<void> saveRecentFile(ReadableFile file);
  Future<void> markFileAsLastOpened(ReadableFile file);
  // Future<void> clearRecentFiles();
  // Future<ReadableFile?> getLastOpenedFile();
  // Future<void> deleteRecentFile(ReadableFile file);
}
