// lib/src/services/file_scanner.dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileScanner {
  // For Android 10+, we don't need storage permission for app's private directories
  static Future<List<FileSystemEntity>> getReadableFiles() async {
    List<FileSystemEntity> foundFiles = [];

    try {
      // Only scan app's private directories (no permission needed)
      List<Directory?> directories = [
        await getApplicationDocumentsDirectory(),
        await getExternalStorageDirectory(),
        await getDownloadsDirectory(),
      ];

      for (var dir in directories) {
        if (dir != null && await dir.exists()) {
          await _scanDirectory(dir, foundFiles);
        }
      }

      // Sort by modification date (newest first)
      foundFiles.sort((a, b) {
        try {
          var aStat = a.statSync();
          var bStat = b.statSync();
          return bStat.modified.compareTo(aStat.modified);
        } catch (e) {
          return 0;
        }
      });
    } catch (e) {
      print('Error scanning files: $e');
    }

    return foundFiles;
  }

  static Future<void> _scanDirectory(Directory dir, List<FileSystemEntity> foundFiles) async {
    try {
      final List<FileSystemEntity> entities = await dir.list().toList();
      
      for (var entity in entities) {
        if (entity is File) {
          String extension = p.extension(entity.path).toLowerCase();
          if (extension == '.pdf' || extension == '.epub') {
            foundFiles.add(entity);
          }
        } else if (entity is Directory) {
          // Recursively scan subdirectories
          await _scanDirectory(entity, foundFiles);
        }
      }
    } catch (e) {
      print('Error scanning directory ${dir.path}: $e');
    }
  }

  static Future<Directory?> getDownloadsDirectory() async {
    try {
      if (Platform.isAndroid) {
        // Try common download paths
        final commonPaths = [
          '/storage/emulated/0/Download',
          '/storage/emulated/0/Downloads',
          '/sdcard/Download',
        ];
        
        for (var path in commonPaths) {
          final dir = Directory(path);
          if (await dir.exists()) {
            return dir;
          }
        }
      }
      return await getApplicationSupportDirectory();
    } catch (e) {
      return null;
    }
  }
}