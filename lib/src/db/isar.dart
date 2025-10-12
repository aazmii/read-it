import 'package:flutter/foundation.dart' show kReleaseMode;

import 'package:isar/isar.dart' show Isar;

import '../features/pdf.reader/data/models/opened.file.detail.dart';
import '../features/setting/model/setting.model.dart' show AppSettingSchema;
import '../core/utils/file/paths.dart' show AppDir, appDir, initDir;

const _schema = [AppSettingSchema, RecentFileSchema];
late final Isar db;

Future<void> openDB() async {
  await initDir();
  db = await Isar.open(
    _schema,
    inspector: !kReleaseMode,
    directory: appDir.db.path,
  );
}

void openDBSync(AppDir dir) => db =
    Isar.openSync(_schema, inspector: !kReleaseMode, directory: dir.db.path);
