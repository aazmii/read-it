// lib/src/models/file_model.dart
import 'dart:io';

class ReadableFileEntity {
  final String path;
  final String name;
  final String fileExt;
  final DateTime? lastOpend;
  final int fileSize;

  ReadableFileEntity({
    required this.path,
    this.lastOpend,
    required this.fileSize,
  })  : name = path.split('/').last,
        fileExt = path.split('.').last.toLowerCase();

  factory ReadableFileEntity.fromFileSystemEntity(FileSystemEntity file) {
    final stat = file.statSync();
    return ReadableFileEntity(path: file.path, fileSize: stat.size);
  }
}
