import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:read_it/src/core/providers/isar.provider.dart';
import 'package:read_it/src/features/pdf.reader/data/repositories/pdf.repository.impl.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';
import 'package:read_it/src/features/pdf.reader/domain/usecases/get.recent.files.dart' show GetRecentReadableFiles;
import 'package:read_it/src/features/pdf.reader/domain/usecases/save.file.dart' show UpdateRecentFile;
import 'package:read_it/src/features/pdf.reader/domain/usecases/scan.files.from.device.dart' show GetAllFileUseCase;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.provider.g.dart';

@riverpod
class StorageFiles extends _$StorageFiles {
  // REPOSITORY
  late final PDFReaderRepository _repo;

  // USE CASES
  late final UpdateRecentFile _updateRecentFile;
  late final GetAllFileUseCase _getAllFiles;

  @override
  Future<List<ReadableFileEntity>> build() async {
    final db = ref.watch(isarDbProvider);
    _repo = PDFReaderRepositoryImpl(db);

    _updateRecentFile = UpdateRecentFile(_repo);
    _getAllFiles = GetAllFileUseCase(_repo);

    final files = await _getAllFiles.call();
    return files;
  }

  Future saveFile(File file) async {
    final readableFile = ReadableFileEntity(
      path: file.path.trim(),
      lastOpend: DateTime.now(),
      fileSize: await file.length(),
    );
    await _updateRecentFile.call(p: readableFile);
  }
}

@riverpod
class RecentFiles extends _$RecentFiles {
  // REPOSITORY
  late final PDFReaderRepository _repo;

  // USE-CASES
  late final UpdateRecentFile _updateRecentFileUseCase;
  late final GetRecentReadableFiles _getRecentFiles;

  // late final PDFReaderRepositoryImpl readableFileRepo;
  @override
  Future<List<ReadableFileEntity>> build() async {
    final db = ref.watch(isarDbProvider);
    _repo = PDFReaderRepositoryImpl(db);
    _updateRecentFileUseCase = UpdateRecentFile(_repo);
    _getRecentFiles = GetRecentReadableFiles(_repo);
    return _getRecentFiles.call();
  }

  Future saveFile(File file) async {
    final readableFile = ReadableFileEntity(
      path: file.path.trim(),
      lastOpend: DateTime.now(),
      fileSize: await file.length(),
    );
    await _updateRecentFileUseCase.call(p: readableFile);
    state = AsyncData(await _getRecentFiles.call());
  }
}

// final recentFilesProvider = StreamProvider<List<ReadableFileEntity>>((ref) {
//   final repo = ref.watch(pdfRepositoryProvider); // Your repo provider
//   return repo.watchRecentFiles();
// });

// final recentFilesProvider = StreamProvider<List<ReadableFileEntity>>((ref) {
//   final db = ref.read(isarServiceProvider).db;
//   db.readableFileIsars;
//   return db.readableFileIsars.watchLazy(fireImmediately: true).asyncMap((_) async {
//     final files = await db.readableFileIsars.where().findAll();
//     return files.map((e) => e.fromDomain()).toList();
//     // return await db.readableFileIsars.where().findAll();
//   });
// });

Future<PlatformFile?> pickPDF() async {
  var result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  return result?.files.firstOrNull;
}

// Future updateDB(File file) async {
//   final isarService = IsarService();
//   final savedFile = await isarService.db.readableFileIsars.filter().pathEndsWith(file.name ?? '').findFirst();
//   if (savedFile != null) {
//     ///Update last open time
//     await isarService.db.writeTxn(() async {
//       await isarService.db.readableFileIsars.put(
//         savedFile..lastOpened = DateTime.now(),
//       ); // Insertion & modification
//     });
//   } else {
//     //insert as new
//     await isarService.db.writeTxn(
//       () async {
//         await isarService.db.readableFileIsars.put(
//           ReadableFileIsar(
//             path: file.path.trim(),
//             lastOpened: DateTime.now(),
//             fileSize: await file.length(),
//           ),
//         );
//       },
//     );
//   }
// }
// Future updateDB(File file) async {
//   final isarService = IsarService();
//   final savedFile = await isarService.db.readableFileIsars.filter().pathEndsWith(file.name ?? '').findFirst();
//   if (savedFile != null) {
//     ///Update last open time
//     await isarService.db.writeTxn(() async {
//       await isarService.db.readableFileIsars.put(
//         savedFile..lastOpened = DateTime.now(),
//       ); // Insertion & modification
//     });
//   } else {
//     //insert as new
//     await isarService.db.writeTxn(
//       () async {
//         await isarService.db.readableFileIsars.put(
//           ReadableFileIsar(
//             path: file.path.trim(),
//             lastOpened: DateTime.now(),
//             fileSize: await file.length(),
//           ),
//         );
//       },
//     );
//   }
// }
