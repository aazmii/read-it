import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

//DEEPSEEK
class PdfWordExtractor extends StatefulWidget {
  const PdfWordExtractor({super.key});

  @override
  PdfWordExtractorState createState() => PdfWordExtractorState();
}

class PdfWordExtractorState extends State<PdfWordExtractor> {
  final PdfViewerController _pdfViewerController = PdfViewerController();
  String? _selectedWord;
  PdfDocument? _document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Word Extractor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              // Load the PDF document
              final ByteData data = await rootBundle.load('assets/pdf/sample.pdf');
              final Uint8List bytes = data.buffer.asUint8List();
              _document = PdfDocument(inputBytes: bytes);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_selectedWord != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Selected word: $_selectedWord'),
            ),
          Expanded(
            child: SfPdfViewer.asset(
              'assets/pdf/sample.pdf',
              controller: _pdfViewerController,
              onTap: (PdfGestureDetails details) async {
                if (_document == null) return;
                // Get page number from details
                final int pageNumber = details.pageNumber;

                // Create text extractor
                final PdfTextExtractor extractor = PdfTextExtractor(_document!);

                // Get text from the specific page
                // final pageText = extractor.extractText(
                //   startPageIndex: pageNumber - 1,
                //   endPageIndex: pageNumber - 1,
                // );

                // Get text bounds collection
                final List<TextLine> textLines = extractor.extractTextLines(
                  startPageIndex: pageNumber - 1,
                  endPageIndex: pageNumber - 1,
                );

                // Find the word at the tapped position
                for (final line in textLines) {
                  for (final word in line.wordCollection) {
                    final Rect bounds = word.bounds;
                    if (bounds.contains(details.position)) {
                      setState(() {
                        _selectedWord = word.text;
                      });
                      return;
                    }
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _document?.dispose();
    super.dispose();
  }
}
