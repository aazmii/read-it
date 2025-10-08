// lib/src/services/file_scanner.dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileScanner {
  static Future<List<FileSystemEntity>> getReadableFiles() async {
    List<FileSystemEntity> foundFiles = [];

    try {
      // Get app-specific directories (no permission needed)
      List<Directory> directories = await _getAccessibleDirectories();
      print('Scanning directories: ${directories.map((d) => d.path).join(', ')}');

      for (var dir in directories) {
        if (await dir.exists()) {
          print('Scanning directory: ${dir.path}');
          await _scanDirectory(dir, foundFiles);
        } else {
          print('Directory does not exist: ${dir.path}');
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

      print('Total PDF/EPUB files found: ${foundFiles.length}');
    } catch (e) {
      print('Error scanning files: $e');
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
            print('Found Download directory: $path');
            directories.add(dir);
            break; // Use the first one that exists
          }
        } catch (e) {
          print('Cannot access Download directory $path: $e');
        }
      }
    } catch (e) {
      print('Error getting directories: $e');
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
            print('✅ Found readable file: ${entity.path}');
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
              print('Cannot scan subdirectory ${entity.path}: $e');
            }
          }
        }
      }
    } catch (e) {
      print('❌ Error scanning directory ${dir.path}: $e');
    }
  }

  // Method to manually check Download directory
  static Future<void> debugDownloadDirectory() async {
    try {
      final downloadDir = Directory('/storage/emulated/0/Download');
      if (await downloadDir.exists()) {
        print('📁 Download directory exists: ${downloadDir.path}');

        final files = await downloadDir.list().toList();
        print('📄 Total files in Download: ${files.length}');

        for (var file in files) {
          if (file is File) {
            String extension = p.extension(file.path).toLowerCase();
            print('${extension == '.pdf' || extension == '.epub' ? '✅' : '❌'} ${file.path}');
          }
        }
      } else {
        print('❌ Download directory does not exist');
      }
    } catch (e) {
      print('❌ Cannot access Download directory: $e');
    }
  }
}
