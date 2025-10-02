import 'dart:typed_data';

import 'package:pdfx/pdfx.dart';

Future<Uint8List?> getPdfPageImageBytes({
  required String pdfFilePath,
  required int pageNumber,
  double scale = 3.0,
}) async {
  try {
    final pdfDocument = await PdfDocument.openFile(pdfFilePath);

    // if (pageNumber < 1 || pageNumber > pdfDocument.pagesCount) {
    //   throw Exception('Invalid page number');
    // }

    final page = await pdfDocument.getPage(pageNumber);
    final pageImage = await page.render(
      width: page.width * scale.toInt(),
      height: page.height * scale.toInt(),
      format: PdfPageImageFormat.png,
      backgroundColor: '#ffffff',
    );

    page.close();
    pdfDocument.close();

    return pageImage?.bytes;
  } catch (e) {
    return null;
  }
}
