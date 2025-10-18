import 'package:read_it/src/core/usecase/usecase.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';

class GetRecentReadableFiles implements AsyncUseCase<List<ReadableFileEntity>, void> {
  final PDFReaderRepository _isarReadableFileRepo;

  GetRecentReadableFiles(this._isarReadableFileRepo);

  @override
  Future<List<ReadableFileEntity>> call({void p}) {
    return _isarReadableFileRepo.getRecentFiles();
  }
}
