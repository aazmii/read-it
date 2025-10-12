import 'package:isar/isar.dart';
import 'package:read_it/src/features/pdf.reader/data/models/opened.file.detail.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';

class IsarReadableFileRepoImpl implements IsarReadableFileRepo {
  final Isar db;
  IsarReadableFileRepoImpl(this.db);

  @override
  Stream<List<ReadableFile>> watchRecentFiles() {
    return db.readableFileIsars.watchLazy(fireImmediately: true).asyncMap((_) async {
      final files = await db.readableFileIsars.where().findAll();
      return files.map((e) => e.fromDomain()).toList();
    });
  }

  @override
  Future<List<ReadableFile>> getRecentFiles() {
    final files = db.readableFileIsars.where().findAll();
    return files.then((value) => value.map((e) => e.fromDomain()).toList());
  }

  @override
  Future<void> markFileAsLastOpened(ReadableFile file) {
    return db.writeTxn(() async {
      final allFiles = await db.readableFileIsars.where().findAll();
      for (var element in allFiles) {
        if (element.path == file.path) {
          element.lastOpened = DateTime.now();
          await db.readableFileIsars.put(element);
        }
      }
    });
  }

  @override
  Future<void> saveRecentFile(ReadableFile file) {
    return db.writeTxn(() async {
      await db.readableFileIsars.put(
        ReadableFileIsar.toDomain(file),
      );
    });
  }

  @override
  Future<List<ReadableFile>> scanForReadableFiles() {
    final files = db.readableFileIsars.where().findAll();
    return files.then((value) => value.map((e) => e.fromDomain()).toList());
  }
}
