import 'dart:io';
import 'dart:typed_data' show Uint8List;

import 'package:flutter/material.dart';
import 'package:read_it/src/core/extensions/extensions.dart';
import 'package:read_it/src/modules/home.dart/models/readable.file.dart';
import 'package:read_it/src/modules/home.dart/provider/pdf.to.image.dart';
import 'package:read_it/src/modules/home.dart/services/file.scanner.dart';
import 'package:read_it/src/modules/home.dart/view/components/all.readable.file.section/error.placeholder.dart';
import 'package:read_it/src/modules/pdf.viewer/view/pdf.viewer.dart';

import 'empty.file.placeholder.dart' show EmptyFilePlaceholder;

class StorageFilesGridList extends StatefulWidget {
  const StorageFilesGridList({super.key});

  @override
  State<StorageFilesGridList> createState() => _ReadableFilesGridListState();
}

class _ReadableFilesGridListState extends State<StorageFilesGridList> {
  List<ReadableFile> _files = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadFilesFromStorage();
  }

  Future<void> _loadFilesFromStorage() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final fileEntities = await FileScanner.getReadableFiles();
      final files = fileEntities.map((e) => ReadableFile.fromFile(e)).toList();

      setState(() {
        _files = files;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Could not access storage. Use "Add Files" button.';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) const Center(child: CircularProgressIndicator());
    if (_errorMessage.isNotEmpty) return ErrorPlacehoder(onRetry: _loadFilesFromStorage, msg: _errorMessage);
    if (_files.isEmpty) return EmptyFilePlaceholder(onRetry: _loadFilesFromStorage);

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
            itemCount: _files.length,
            itemBuilder: (context, index) {
              return _FileGridItem(
                file: _files[index],
                // onTap: () => _onFileTap(_files[index]),
                onTap: () {
                  context.push(ScyncfuncitonPdfDetail(file: File(_files[index].path)));
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
  final ReadableFile file;
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
                  color: imageBytes == null ? _getFileColor(widget.file.extension) : null,
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
                          widget.file.extension == 'pdf' ? Icons.picture_as_pdf : Icons.menu_book,
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
                '${widget.file.formattedSize} • ${widget.file.formattedDate}',
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
