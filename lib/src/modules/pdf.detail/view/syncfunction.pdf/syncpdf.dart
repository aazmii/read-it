import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfWordExtractor extends ConsumerStatefulWidget {
  const PdfWordExtractor({super.key});

  @override
  PdfWordExtractorState createState() => PdfWordExtractorState();
}

class PdfWordExtractorState extends ConsumerState<PdfWordExtractor> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  String? _selectedWord;
  PdfDocument? _document;
  late File file;
  final GlobalKey _pdfViewerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    final selectedFile = ref.read(selectedPDFProvider);
    if (selectedFile != null) file = selectedFile;
    _document = PdfDocument(inputBytes: file.readAsBytesSync());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Syncfunction PDF')),
      body: Column(
        children: [
          if (_selectedWord != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Selected word: $_selectedWord'),
            ),
          Expanded(
            child: SfPdfViewer.file(
              key: _pdfViewerKey,
              file,
              controller: _pdfViewerController,
              onTap: _onTap,
            ),
          ),
        ],
      ),
    );
  }

  _onTap(PdfGestureDetails details) {
    final int pageNumber = details.pageNumber;
    final PdfPage page = _document!.pages[pageNumber - 1];
    final Size pageSize = page.size;

    // Get the render box of the PDF viewer
    final RenderBox renderBox = _pdfViewerKey.currentContext!.findRenderObject() as RenderBox;
    // Get the tap position relative to the PDF viewer
    final Offset localPosition = renderBox.globalToLocal(details.position);

    // Get the current zoom level
    final double zoomLevel = _pdfViewerController.zoomLevel;

    // Calculate PDF coordinates
    // Note: This is an approximation - you may need to adjust based on your PDF layout
    final double pdfX = localPosition.dx / zoomLevel;
    final double pdfY = (localPosition.dy / zoomLevel) - (pageNumber - 1) * pageSize.height;

    final PdfTextExtractor extractor = PdfTextExtractor(_document!);
    try {
      final List<TextLine> textLines = extractor.extractTextLines(
        startPageIndex: pageNumber - 1,
        endPageIndex: pageNumber - 1,
      );

      for (final line in textLines) {
        for (final word in line.wordCollection) {
          final Rect bounds = word.bounds;

          // PDF coordinates have (0,0) at bottom-left
          final double wordTop = pageSize.height - bounds.top;
          final double wordBottom = pageSize.height - bounds.bottom;

          const double tolerance = 0.0; // Increased tolerance

          // Check if tap is within word bounds with tolerance
          if (pdfX >= bounds.left - tolerance &&
              pdfX <= bounds.right + tolerance &&
              pdfY >= wordBottom - tolerance &&
              pdfY <= wordTop + tolerance) {
            setState(() {
              _selectedWord = word.text;
            });
            return;
          }
        }
      }
    } catch (e) {
      print('Error extracting text: $e');
    }
  }

  // _onTap2(PdfGestureDetails details) {
  //   final int pageNumber = details.pageNumber;
  //   final PdfTextExtractor extractor = PdfTextExtractor(_document!);
  //   try {
  //     final List<TextLine> textLines = extractor.extractTextLines(
  //       startPageIndex: pageNumber - 1,
  //       endPageIndex: pageNumber - 1,
  //     );
  //     for (final line in textLines) {
  //       for (final word in line.wordCollection) {
  //         final Rect bounds = word.bounds;
  //         print(word.text);

  //         const double tolerance = 0.0; // for more forgiving tap detection
  //         final Rect expandedBounds = Rect.fromLTRB(
  //           bounds.left - tolerance,
  //           bounds.top - tolerance,
  //           bounds.right + tolerance,
  //           bounds.bottom + tolerance,
  //         );

  //         if (expandedBounds.contains(details.position)) {
  //           setState(() {
  //             _selectedWord = word.text;
  //           });
  //           return;
  //         }
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void dispose() {
    _document?.dispose();
    super.dispose();
  }
}
