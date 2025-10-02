import 'dart:io';

import 'package:flutter/material.dart';
import 'package:read_it/src/extensions/extensions.dart';
import 'package:read_it/src/modules/home.dart/models/opened.file.detail.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart' as syncviewer;

class RecentFileTile extends StatelessWidget {
  const RecentFileTile({super.key, required this.file, this.onPressed});
  final RecentFile file;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.theme.secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
        ),
        height: 150,
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: syncviewer.SfPdfViewer.file(
                  File(file.path!),
                  canShowTextSelectionMenu: false,
                  pageLayoutMode: syncviewer.PdfPageLayoutMode.continuous,
                  canShowPageLoadingIndicator: false,
                  canShowScrollStatus: false,
                  canShowScrollHead: false,
                  pageSpacing: 0,
                  enableDoubleTapZooming: false,
                  enableTextSelection: false,
                  enableDocumentLinkAnnotation: false,
                  enableHyperlinkNavigation: false,
                  initialZoomLevel: 1.0,
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
                    file.path!.getLast('/'),
                    style: context.text.titleMedium,
                  ),
                  const Text('Another line')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
