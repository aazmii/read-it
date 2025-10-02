import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_it/src/extensions/extensions.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

Future<File> extractCoverPage(File originalPdf) async {
  // Load the original PDF document
  final PdfDocument originalDoc = PdfDocument(
    inputBytes: await originalPdf.readAsBytes(),
  );

  // Get the first page
  final PdfPage firstPage = originalDoc.pages[0];

  // Create a template from the first page
  final PdfTemplate template = firstPage.createTemplate();

  // Create a new PDF document
  final PdfDocument coverDoc = PdfDocument();

  // Add a new page and draw the template onto it
  final PdfPage newPage = coverDoc.pages.add();
  newPage.graphics.drawPdfTemplate(template, const Offset(0, 0));

  // Save the new document to bytes
  final List<int> coverBytes = await coverDoc.save();

  // Dispose the documents
  originalDoc.dispose();
  coverDoc.dispose();

  // Write the bytes to a new file
  final Directory tempDir = await getTemporaryDirectory();
  final File coverFile = File('${tempDir.path}/${originalPdf.name}');
  await coverFile.writeAsBytes(coverBytes, flush: true);

  return coverFile;
}
