import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/core/extensions/extensions.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/presentation/provider/home.provider.dart';
import 'package:read_it/src/features/pdf.reader/presentation/provider/pdf.to.image.dart';

import '../../pdf.view.page/pdf.view.page.dart';
import 'empty.file.placeholder.dart' show EmptyFilePlaceholder;

class StorageFilesGridList extends ConsumerWidget {
  const StorageFilesGridList({super.key});

  Future<void> _loadFilesFromStorage(WidgetRef ref) async => ref.invalidate(storageFilesProvider);

  @override
  Widget build(BuildContext context, ref) {
    final files = ref.watch(storageFilesProvider).valueOrNull;

    // if (_isLoading) const Center(child: CircularProgressIndicator());
    // if (_errorMessage.isNotEmpty) return ErrorPlacehoder(onRetry: _loadFilesFromStorage, msg: _errorMessage);
    if (files == null || files.isEmpty) return EmptyFilePlaceholder(onRetry: () => _loadFilesFromStorage(ref));

    return Column(
      children: [
        Row(
          children: [
            Text('All Files', style: context.text.titleMedium),
            const Spacer(),
            const Icon(Icons.filter_list),
          ],
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7,
            ),
            itemCount: files.length,
            itemBuilder: (context, index) {
              return _FileGridItem(
                file: files[index],
                // onTap: () => _onFileTap(_files[index]),
                onTap: () {
                  ref.read(selectedPDFProvider.notifier).update = File(files[index].path);
                  context.push(ScyncfuncitonPdfDetail(file: File(files[index].path)));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FileGridItem extends StatefulWidget {
  final ReadableFileEntity file;
  final VoidCallback onTap;

  const _FileGridItem({
    required this.file,
    required this.onTap,
  });

  @override
  State<_FileGridItem> createState() => _FileGridItemState();
}

Uint8List? imageBytes;

class _FileGridItemState extends State<_FileGridItem> {
  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    imageBytes = await getPdfPageImageBytes(pdfFilePath: widget.file.path);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // File icon/thumbnail
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: imageBytes == null ? _getFileColor(widget.file.fileExt) : null,
                  borderRadius: BorderRadius.circular(8),
                  image: imageBytes != null
                      ? DecorationImage(
                          image: MemoryImage(imageBytes!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: imageBytes == null
                    ? Center(
                        child: Icon(
                          widget.file.fileExt == 'pdf' ? Icons.picture_as_pdf : Icons.menu_book,
                          size: 48,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
              const SizedBox(height: 8),
              // File name
              Text(
                widget.file.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              // File info
              Text(
                '${widget.file.fileSize.toReadableFileSize} • ${widget.file.lastOpend?.formattedDate}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey.shade600,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getFileColor(String extension) {
    return extension == 'pdf' ? Colors.red.shade400 : Colors.blue.shade400;
  }
}
