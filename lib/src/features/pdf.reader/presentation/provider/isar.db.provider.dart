import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_it/src/features/pdf.reader/data/models/opened.file.detail.dart';

final isarDbProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Initialize Isar before using this provider');
});

// Somewhere in main() or before runApp
Future<Isar> initIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [ReadableFileIsarSchema], // all your Isar schemas
    directory: dir.path,
  );
  return isar;
}
