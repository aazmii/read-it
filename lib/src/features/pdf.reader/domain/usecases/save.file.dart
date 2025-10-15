import 'package:read_it/src/core/usecase/usecase.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';

class UpdateRecentFile implements UseCase<void, ReadableFileEntity> {
  final PDFReaderRepository _isarReadableFileRepo;

  UpdateRecentFile(this._isarReadableFileRepo);

  @override
  Future<void> call({ReadableFileEntity? p}) {
    return _isarReadableFileRepo.saveRecentFile(p!);
  }
}
