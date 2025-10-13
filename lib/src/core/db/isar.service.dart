import 'package:flutter/foundation.dart' show kReleaseMode;

import 'package:isar/isar.dart' show Isar;
import 'package:read_it/src/core/utils/file/paths.dart';
import 'package:read_it/src/features/pdf.reader/data/models/opened.file.detail.dart' show ReadableFileIsarSchema;
import 'package:read_it/src/features/setting/model/setting.model.dart' show AppSettingSchema;

const _schema = [AppSettingSchema, ReadableFileIsarSchema];
// late final Isar db;

class IsarService {
  IsarService._internal();
  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;

  late final Isar _db;
  Isar get db => _db;

  Future<void> openDB() async {
    if (Isar.instanceNames.isNotEmpty) {
      _db = Isar.getInstance()!;
      return;
    }

    await initDir();
    _db = await Isar.open(
      _schema,
      inspector: !kReleaseMode,
      directory: appDir.db.path,
    );
  }

  void openDBSync(AppDir dir) {
    if (Isar.instanceNames.isNotEmpty) {
      _db = Isar.getInstance()!;
      return;
    }

    _db = Isar.openSync(
      _schema,
      inspector: !kReleaseMode,
      directory: dir.db.path,
    );
  }
}

// class IsarService {
//   late final Isar _db;
//   Isar get db => _db;

//   Future<void> openDB() async {
//     await initDir();
//     _db = await Isar.open(
//       _schema,
//       inspector: !kReleaseMode,
//       directory: appDir.db.path,
//     );
//   }

//   void openDBSync(AppDir dir) => _db = Isar.openSync(_schema, inspector: !kReleaseMode, directory: dir.db.path);
// }
