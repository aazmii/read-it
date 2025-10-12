// lib/src/models/file_model.dart
import 'dart:io';

class ReadableFile {
  final String path;
  final String name;
  final String fileExt;
  final DateTime? lastOpend;
  final int fileSize;

  ReadableFile({
    required this.path,
    this.lastOpend,
    required this.fileSize,
  })  : name = path.split('/').last,
        fileExt = path.split('.').last.toLowerCase();

  factory ReadableFile.fromFile(FileSystemEntity file) {
    final stat = file.statSync();
    return ReadableFile(path: file.path, fileSize: stat.size);
  }
}
