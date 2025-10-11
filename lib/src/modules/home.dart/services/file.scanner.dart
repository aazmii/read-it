// lib/src/services/file_scanner.dart
import 'dart:io';
import 'package:flutter/material.dart' show debugPrint;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileScanner {
  static Future<List<FileSystemEntity>> getReadableFiles() async {
    List<FileSystemEntity> foundFiles = [];

    try {
      // Get app-specific directories (no permission needed)
      List<Directory> directories = await _getAccessibleDirectories();
      debugPrint('Scanning directories: ${directories.map((d) => d.path).join(', ')}');

      for (var dir in directories) {
        if (await dir.exists()) {
          debugPrint('Scanning directory: ${dir.path}');
          await _scanDirectory(dir, foundFiles);
        } else {
          debugPrint('Directory does not exist: ${dir.path}');
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

      debugPrint('Total PDF/EPUB files found: ${foundFiles.length}');
    } catch (e) {
      debugPrint('Error scanning files: $e');
    }

    return foundFiles;
  }

  static Future<List<Directory>> _getAccessibleDirectories() async {
    List<Directory> directories = [];

    try {
      // App's private directory
      final appDocDir = await getApplicationDocumentsDirectory();
      directories.add(appDocDir);

      // External files directory
      final externalDir = await getExternalStorageDirectory();
      if (externalDir != null) {
        directories.add(externalDir);
      }

      // Try multiple Download directory paths
      final possibleDownloadPaths = [
        '/storage/emulated/0/Download',
        '/storage/emulated/0/Downloads',
        '/sdcard/Download',
        '/sdcard/Downloads',
      ];

      for (var path in possibleDownloadPaths) {
        try {
          final dir = Directory(path);
          if (await dir.exists()) {
            debugPrint('Found Download directory: $path');
            directories.add(dir);
            break; // Use the first one that exists
          }
        } catch (e) {
          debugPrint('Cannot access Download directory $path: $e');
        }
      }
    } catch (e) {
      debugPrint('Error getting directories: $e');
    }

    return directories;
  }

  static Future<void> _scanDirectory(Directory dir, List<FileSystemEntity> foundFiles) async {
    try {
      final List<FileSystemEntity> entities = await dir.list().toList();

      for (var entity in entities) {
        if (entity is File) {
          String extension = p.extension(entity.path).toLowerCase();
          // Only add PDF and EPUB files
          if (extension == '.pdf' || extension == '.epub') {
            foundFiles.add(entity);
            debugPrint('✅ Found readable file: ${entity.path}');
          }
        } else if (entity is Directory) {
          // Skip system directories to avoid permission issues
          final path = entity.path.toLowerCase();
          if (!path.contains('/.') && // Skip hidden directories
              !path.contains('android') &&
              !path.contains('system') &&
              !path.contains('cache')) {
            try {
              await _scanDirectory(entity, foundFiles);
            } catch (e) {
              debugPrint('Cannot scan subdirectory ${entity.path}: $e');
            }
          }
        }
      }
    } catch (e) {
      debugPrint('❌ Error scanning directory ${dir.path}: $e');
    }
  }
}
