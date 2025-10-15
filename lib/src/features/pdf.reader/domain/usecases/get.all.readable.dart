import 'package:read_it/src/core/usecase/usecase.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/domain/repositories/pdf.reader.repo.dart';

class GetAllArticlesUseCase implements UseCase<List<ReadableFile>, void> {
  final IsarReadableFileRepo _isarReadableFileRepo;

  GetAllArticlesUseCase(this._isarReadableFileRepo);

  @override
  Future<List<ReadableFile>> call({void p}) {
    return _isarReadableFileRepo.getRecentFiles();
  }
}
