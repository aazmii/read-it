import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';
import 'package:pattern_m/src/modules/pdf.viewer/components/popups.dart';
import 'package:pattern_m/src/modules/pdf.viewer/provider/meaning.provider.dart';
import 'package:pattern_m/src/modules/pdf.viewer/provider/detail.provider.dart';
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

  String? _selectedText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              if (_selectedText == null || _selectedText!.isEmpty) return;
              await ref.read(meaningProvider.notifier).findMeaning(_selectedText!);
              final meaning = ref.read(meaningProvider);
              if (meaning == null) return;
              await showMeaningBottomSheet(context, meaning);
              _pdfViewerController.clearSelection();
              if (!context.mounted) return;
              // await showMeaningDialog(ref, context, meaning);

              ref.invalidate(meaningProvider);
            },
          )
        ],
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
          setState(() {
            _selectedText = details.selectedText;
          });
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
