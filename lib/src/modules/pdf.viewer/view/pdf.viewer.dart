import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/dictionary/api/dictionary.api.dart';
import 'package:pattern_m/src/modules/pdf.viewer/provider/detail.provider.dart';
import 'package:pattern_m/src/modules/pdf.viewer/provider/meaning.provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart' as viewer;

import '../components/word.bottom.sheet/word.meaning.bottomsheet.dart';

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
    final client = ref.watch(httpClientProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          if (_selectedText != null)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                if (_selectedText == null || _selectedText!.isEmpty) return;
                // if (_selectedText!.length > 1) return;
                final word = await DictionaryApi(client).fetchMeaning(_selectedText!);
                // await ref.read(meaningProvider.notifier).findMeaning(_selectedText!);
                if (word == null || !context.mounted) return;
                await showWordBottomSheet(context, word);
                _pdfViewerController.clearSelection();
                setState(() => _selectedText = null);
                if (!context.mounted) return;
                // await showMeaningDialog(ref, context, meaning);
                //=============================
                ref.invalidate(meaningProvider);
                // if (_selectedText == null || _selectedText!.isEmpty) return;
                // await ref.read(meaningProvider.notifier).findMeaning(_selectedText!);
                // final meaning = ref.read(meaningProvider);
                // if (meaning == null || !context.mounted) return;
                // await showMeaningBottomSheet(context, meaning);
                // _pdfViewerController.clearSelection();
                // setState(() => _selectedText = null);
                // if (!context.mounted) return;
                // // await showMeaningDialog(ref, context, meaning);

                // ref.invalidate(meaningProvider);
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
