import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:isar/isar.dart';
import 'package:read_it/src/core/db/isar.service.dart';
import 'package:read_it/src/core/extensions/extensions.dart';
import 'package:read_it/src/core/providers/isar.provider.dart';
import 'package:read_it/src/features/pdf.reader/data/models/opened.file.detail.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// final recentFilesProvider = StreamProvider<List<ReadableFile>>((ref) {
//   final repo = ref.watch(pdfRepositoryProvider); // Your repo provider
//   return repo.watchRecentFiles();
// });
final recentFilesProvider = StreamProvider<List<ReadableFile>>((ref) {
  final db = ref.read(isarServiceProvider).db;
  db.readableFileIsars;
  return db.readableFileIsars.watchLazy(fireImmediately: true).asyncMap((_) async {
    final files = await db.readableFileIsars.where().findAll();
    return files.map((e) => e.fromDomain()).toList();
    // return await db.readableFileIsars.where().findAll();
  });
});

Future<PlatformFile?> pickPDF() async {
  var result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );
  return result?.files.firstOrNull;
}

Future updateDB(File file) async {
  final isarService = IsarService();
  final savedFile = await isarService.db.readableFileIsars.filter().pathEndsWith(file.name ?? '').findFirst();
  if (savedFile != null) {
    ///Update last open time
    await isarService.db.writeTxn(() async {
      await isarService.db.readableFileIsars.put(
        savedFile..lastOpened = DateTime.now(),
      ); // Insertion & modification
    });
  } else {
    //insert as new
    await isarService.db.writeTxn(
      () async {
        await isarService.db.readableFileIsars.put(
          ReadableFileIsar(
            path: file.path.trim(),
            lastOpened: DateTime.now(),
            fileSize: await file.length(),
          ),
        );
      },
    );
  }
}
