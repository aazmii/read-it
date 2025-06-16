import 'package:pattern_m/src/features/home/domain%20/entities/opened.file.detail.dart';

abstract class PdfRepository {
  Future<List<RecentFile>> getAllPdfs();
}
