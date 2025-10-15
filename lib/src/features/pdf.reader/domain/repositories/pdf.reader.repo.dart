import '../entities/readable.file.dart';

abstract class PDFReaderRepository {
  Stream<List<ReadableFileEntity>> watchRecentFiles();
  Future<List<ReadableFileEntity>> scanFilesFromDevice();//
  Future<List<ReadableFileEntity>> getRecentFiles();//
  Future<void> saveRecentFile(ReadableFileEntity file);//
  // Future<void> markFileAsLastOpened(ReadableFileEntity file);
  // Future<void> clearRecentFiles();
  // Future<ReadableFileEntity?> getLastOpenedFile();
  // Future<void> deleteRecentFile(ReadableFileEntity file);
}
