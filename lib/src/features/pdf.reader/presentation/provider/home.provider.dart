import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:read_it/src/core/providers/isar.provider.dart';
import 'package:read_it/src/features/pdf.reader/data/datasources/file.scanner.dart';
import 'package:read_it/src/features/pdf.reader/data/repositories/pdf.repository.impl.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.provider.g.dart';

@riverpod
class StorageFiles extends _$StorageFiles {
  late final IsarReadableFileRepoImpl readableFileRepo;
  @override
  Future<List<ReadableFile>> build() async {
    final db = ref.watch(isarDbProvider);
    readableFileRepo = IsarReadableFileRepoImpl(db);
    final fileEntities = await FileScanner.getReadableFiles();
    return fileEntities.map((e) => ReadableFile.fromFile(e)).toList();
  }

  Future saveFile(File file) async {
    final readableFile = ReadableFile(
      path: file.path.trim(),
      lastOpend: DateTime.now(),
      fileSize: await file.length(),
    );
    await readableFileRepo.saveRecentFile(readableFile);
  }
}

@riverpod
class RecentFiles extends _$RecentFiles {
  late final IsarReadableFileRepoImpl readableFileRepo;
  @override
  Future<List<ReadableFile>> build() async {
    final db = ref.watch(isarDbProvider);
    readableFileRepo = IsarReadableFileRepoImpl(db);
    return await readableFileRepo.getRecentFiles();
  }

  Future saveFile(File file) async {
    final readableFile = ReadableFile(
      path: file.path.trim(),
      lastOpend: DateTime.now(),
      fileSize: await file.length(),
    );
    await readableFileRepo.saveRecentFile(readableFile);
    ref.invalidateSelf();
  }
}

// final recentFilesProvider = StreamProvider<List<ReadableFile>>((ref) {
//   final repo = ref.watch(pdfRepositoryProvider); // Your repo provider
//   return repo.watchRecentFiles();
// });

// final recentFilesProvider = StreamProvider<List<ReadableFile>>((ref) {
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
