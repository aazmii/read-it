import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:read_it/src/extensions/extensions.dart';
import 'package:read_it/src/modules/home.dart/models/opened.file.detail.dart';
import 'package:read_it/src/modules/home.dart/provider/pdf.to.image.dart';

class RecentFileTile extends StatefulWidget {
  const RecentFileTile({super.key, required this.file, this.onPressed});
  final RecentFile file;
  final VoidCallback? onPressed;

  @override
  State<RecentFileTile> createState() => _RecentFileTileState();
}

class _RecentFileTileState extends State<RecentFileTile> {
  Uint8List? imageBytes;
  @override
  initState() {
    super.initState();
    _loadImage();
  }

  _loadImage() async {
    imageBytes = await getPdfPageImageBytes(pdfFilePath: widget.file.path!, pageNumber: 1, scale: 2.0);
    if (mounted) setState(() {});
  }

  String get fileExtension => widget.file.path!.split('.').last;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.theme.secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        width: context.width * 0.92,
        child: IntrinsicHeight(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: imageBytes != null
                    ? Image.memory(imageBytes!, fit: BoxFit.cover)
                    : Container(
                        color: Colors.grey.shade300,
                        child: Center(
                          child: Icon(Icons.image, color: context.theme.primaryColor),
                        ),
                      ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.file.path!.getLast('/'),
                      style: context.text.titleMedium,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.folder, size: 22, color: Colors.grey),
                        const SizedBox(width: 5),
                        Text(fileExtension.capitalize),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
