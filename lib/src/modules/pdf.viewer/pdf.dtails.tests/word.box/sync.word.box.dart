import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/modules/pdf.viewer/provider/detail.provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class SyncfunctinoWordBox extends ConsumerStatefulWidget {
  const SyncfunctinoWordBox({super.key});

  @override
  PdfWordTapPageState createState() => PdfWordTapPageState();
}

class PdfWordTapPageState extends ConsumerState<SyncfunctinoWordBox> {
  List<_WordBox> _wordBoxes = [];

  @override
  void initState() {
    super.initState();
    _loadPdfAndExtractWords();
  }

  Future<void> _loadPdfAndExtractWords() async {
    // Load PDF file as bytes
    // final bytes = await rootBundle.load('assets/pdf/sample.pdf');
    // final Uint8List pdfData = bytes.buffer.asUint8List();
    final file = ref.read(selectedPDFProvider);
    final PdfDocument document = PdfDocument(inputBytes: file!.readAsBytesSync());

    final PdfTextExtractor extractor = PdfTextExtractor(document);
    final List<TextLine> lines = extractor.extractTextLines(startPageIndex: 0, endPageIndex: 0);

    final List<_WordBox> wordBoxes = [];

    for (var line in lines) {
      for (var word in line.wordCollection) {
        final bounds = word.bounds;
        wordBoxes.add(_WordBox(
          word: word.text,
          rect: Rect.fromLTWH(bounds.left, bounds.top, bounds.width, bounds.height),
        ));
      }
    }

    document.dispose();

    setState(() {
      _wordBoxes = wordBoxes;
    });
  }

  void _handleTap(Offset localPosition) {
    for (final box in _wordBoxes) {
      if (box.rect.contains(localPosition)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(box.word)),
        );
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap Word in PDF')),
      body: GestureDetector(
        onTapDown: (details) {
          _handleTap(details.localPosition);
        },
        child: Stack(
          children: [
            Container(
              color: Colors.grey.shade200,
              child: const Center(
                child: Text(
                  'PDF page image placeholder',
                  style: TextStyle(fontSize: 16, color: Colors.black38),
                ),
              ),
            ),
            // Optional: draw bounding boxes for debug
            ..._wordBoxes.map((box) => Positioned(
                  left: box.rect.left,
                  top: box.rect.top,
                  width: box.rect.width,
                  height: box.rect.height + 20,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(border: Border.all(color: Colors.transparent)),
                    child: Text(
                      box.word,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _WordBox {
  final String word;
  final Rect rect;

  _WordBox({required this.word, required this.rect});
}
