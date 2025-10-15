import 'package:read_it/src/core/usecase/usecase.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';

// typedef FileStream = Stream<List<ReadableFileEntity>>;

class RecentFileStream implements StreamUseCase<List<ReadableFileEntity>, void> {
  final PDFReaderRepository _isarReadableFileRepo;

  RecentFileStream(this._isarReadableFileRepo);

  @override
  Stream<List<ReadableFileEntity>> call({void p}) {
    return _isarReadableFileRepo.watchRecentFiles();
  }
}
