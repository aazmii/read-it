import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  String? _selectedWord;
  // PdfDocument? _document;
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
      appBar: AppBar(title: Text('$_selectedWord')),
      body: viewer.SfPdfViewer.file(
        canShowTextSelectionMenu: false ,
        pageLayoutMode: viewer.PdfPageLayoutMode.single,
        file,
        controller: _pdfViewerController,
        onTextSelectionChanged: (details) => setState(() {
          _selectedWord = details.selectedText;
        }),
      ),
    );
  }

  @override
  void dispose() {
    // _document?.dispose();
    super.dispose();
  }
}
