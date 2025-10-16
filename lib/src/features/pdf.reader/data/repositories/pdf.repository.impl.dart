import 'package:isar/isar.dart';
import 'package:read_it/src/features/pdf.reader/data/datasources/local/file.scanner.service.dart';
import 'package:read_it/src/features/pdf.reader/data/models/opened.file.detail.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';

class PDFReaderRepositoryImpl implements PDFReaderRepository {
  final Isar db;

  PDFReaderRepositoryImpl(this.db);

  @override
  Stream<List<ReadableFileEntity>> watchRecentFiles() {
    return db.readableFileIsars.watchLazy(fireImmediately: true).asyncMap((_) async {
      final files = await db.readableFileIsars.where().findAll();
      return files.map((e) => e.fromDomain()).toList();
    });
  }

  @override
  Future<List<ReadableFileEntity>> getRecentFiles() {
    final files = db.readableFileIsars.where().findAll();
    return files.then((value) => value.map((e) => e.fromDomain()).toList());
  }

  @override
  Future<void> saveRecentFile(ReadableFileEntity file) {
    return db.writeTxn(() async {
      await db.readableFileIsars.put(
        ReadableFileIsar.toDomain(file),
      );
    });
  }

  @override
  Future<List<ReadableFileEntity>> scanFilesFromDevice() async {
    final filesFromDefice = await FileScanner.getReadableFiles();
    return filesFromDefice.map((f) => ReadableFileEntity.fromFileSystemEntity(f)).toList();
  }
}
