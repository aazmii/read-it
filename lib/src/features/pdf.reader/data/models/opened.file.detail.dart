import 'package:isar/isar.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';

part 'opened.file.detail.g.dart';

@Collection()
class ReadableFileIsar {
  Id id = Isar.autoIncrement;
  String? path;

  DateTime? lastOpened;
  int? fileSize;

  ReadableFileIsar({
    this.path,
    this.lastOpened,
    this.fileSize,
  });
  ReadableFileEntity fromDomain() {
    return ReadableFileEntity(path: path!, lastOpend: lastOpened!, fileSize: fileSize ?? 0);
  }

  static ReadableFileIsar toDomain(ReadableFileEntity file) {
    return ReadableFileIsar()
      ..path = file.path
      ..lastOpened = file.lastOpend
      ..fileSize = file.fileSize;
  }
}
