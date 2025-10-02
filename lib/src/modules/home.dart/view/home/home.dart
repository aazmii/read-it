import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/extensions/extensions.dart';
import 'package:read_it/src/modules/home.dart/view/home/recent.files.list.dart';
import 'package:read_it/src/modules/pdf.viewer/provider/detail.provider.dart';
import 'package:read_it/src/modules/pdf.viewer/view/pdf.viewer.dart';

import '../../../drawer/app.drawer.dart';
import '../../provider/home.provider.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // return PdfWordExtractor();
    // AdaptiveTextSelectionToolbar(
    //   anchors: textSelectionToolbarAnchor, // The position where the toolbar should appear
    //   children: [
    //     TextSelectionToolbarButton(
    //       onPressed: () {
    //         // Implement copy logic
    //       },
    //       child: const Text('Copy'),
    //     ),
    //     TextSelectionToolbarButton(
    //       onPressed: () {
    //         // Implement paste logic
    //       },
    //       child: const Text('Paste'),
    //     ),
    //     // Add more custom buttons as needed
    //   ],
    // );
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Recently Opened', style: context.text.titleMedium), const Icon(Icons.arrow_forward_ios)],
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 180, child: RecentFileList())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await _onPickFile(context, ref),
        child: const Icon(Icons.upload),
      ),
    );
  }

  _onPickFile(BuildContext context, WidgetRef ref) async {
    // if (!Platform.isAndroid) return;
    final pickedPlatformFile = await pickPDF();
    if (pickedPlatformFile == null) return;
    final pickedFile = File(pickedPlatformFile.path!);
    await updateDB(pickedFile);

    ref.read(selectedPDFProvider.notifier).update = pickedFile;

    if (!context.mounted) return;
    // context.push(const SyncfunctinoWordBox());
    // context.push(const PdfWordExtractor());
    context.push(const ScyncfuncitonPdfDetail());
    // context.push(const PdfDetail());
    if (!context.mounted) return;
  }
}
