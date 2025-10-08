// lib/src/services/file_picker_service.dart
import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FilePickerService {
  static Future<List<PlatformFile>> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'epub'],
        allowMultiple: true,
      );

      if (result != null && result.files.isNotEmpty) {
        return result.files.where((file) => file.path != null).toList();
      }
    } catch (e) {
      print('Error picking files: $e');
    }
    return [];
  }

  static Future<List<PlatformFile>> getFilesFromDirectory() async {
    try {
      String? directoryPath = await FilePicker.platform.getDirectoryPath();

      if (directoryPath != null) {
        Directory directory = Directory(directoryPath);
        List<FileSystemEntity> entities = await directory.list(recursive: true).toList();

        List<PlatformFile> pdfEpubFiles = [];

        for (var entity in entities) {
          if (entity is File) {
            String path = entity.path;
            String extension = path.split('.').last.toLowerCase();

            if (extension == 'pdf' || extension == 'epub') {
              var stat = entity.statSync();
              pdfEpubFiles.add(PlatformFile(
                name: path.split('/').last,
                path: path,
                size: stat.size,
                bytes: await entity.readAsBytes(),
              ));
            }
          }
        }
        return pdfEpubFiles;
      }
    } catch (e) {
      print('Error getting files from directory: $e');
    }
    return [];
  }
}
