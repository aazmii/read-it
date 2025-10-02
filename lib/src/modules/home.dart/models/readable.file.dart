// lib/src/models/file_model.dart
import 'dart:io';

class ReadableFile {
  final String path;
  final String name;
  final String extension;
  final DateTime? lastModified;
  final int size;

  ReadableFile({
    required this.path,
    required this.name,
    required this.extension,
    this.lastModified,
    this.size = 0,
  });

  factory ReadableFile.fromFile(FileSystemEntity file) {
    final stat = file.statSync();
    return ReadableFile(
      path: file.path,
      name: file.path.split('/').last,
      extension: file.path.split('.').last.toLowerCase(),
      lastModified: stat.modified,
      size: stat.size,
    );
  }

  String get formattedSize {
    if (size < 1024) return '$size B';
    if (size < 1048576) return '${(size / 1024).toStringAsFixed(1)} KB';
    return '${(size / 1048576).toStringAsFixed(1)} MB';
  }

  String get formattedDate {
    if (lastModified == null) return 'Unknown';
    return '${lastModified!.day}/${lastModified!.month}/${lastModified!.year}';
  }
}
