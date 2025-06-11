import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/pdf.detail/modules/components/meaning.dialog.dart';
import 'package:pattern_m/src/modules/pdf.detail/modules/pdf.content/provider/meaning.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart' as viewer;

//DEEPSEEK
class ScyncfuncitonPdfDetail extends ConsumerStatefulWidget {
  const ScyncfuncitonPdfDetail({super.key});

  @override
  PdfWordExtractorState createState() => PdfWordExtractorState();
}

class PdfWordExtractorState extends ConsumerState<ScyncfuncitonPdfDetail> {
  final viewer.PdfViewerController _pdfViewerController = viewer.PdfViewerController();
  late File file;
  @override
  void initState() {
    super.initState();
    final selectedFile = ref.read(selectedPDFProvider);
    if (selectedFile != null) file = selectedFile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: viewer.SfPdfViewer.file(
        file,
        canShowTextSelectionMenu: false,
        pageLayoutMode: viewer.PdfPageLayoutMode.continuous,
        controller: _pdfViewerController,
        onDocumentLoaded: (details) {
          viewer.PdfDocumentLoadedDetails;
          _pdfViewerController.zoomLevel = 1.2;
        },
        onTextSelectionChanged: (details) async {
          if (details.selectedText == null) return;
          await ref.read(meaningProvider.notifier).findMeaning(details.selectedText!);
          final meaning = ref.read(meaningProvider);
          if (meaning == null) return;
          _pdfViewerController.clearSelection();

          await showMeaningDialog(ref, context, meaning);
          ref.invalidate(meaningProvider);
        },
      ),
    );
  }

  @override
  void dispose() {
    // _document?.dispose();
    super.dispose();
  }
}
