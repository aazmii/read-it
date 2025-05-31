import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.detail/provider/detail.provider.dart';
import 'package:pattern_m/src/modules/pdf.detail/view/pdf.detail.dart';
import 'package:pattern_m/src/modules/router/provider/route.provider.dart';
import 'package:pattern_m/src/testing/word.box.2.dart';

import '../../drawer/app.drawer.dart';
import '../provider/home.provider.dart';
import 'components/file.tile.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return PdfWordExtractor();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recently Opened',
              style: context.text.headlineSmall,
            ),
            Expanded(
              child: ref.watch(recentFilesProvider).when(
                    data: (recentFiles) {
                      return ListView(
                        children: List.generate(
                          recentFiles.length,
                          (index) {
                            final recentFile = recentFiles[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FileTile(
                                file: recentFile,
                                onPressed: () async {
                                  ref.read(selectedPDFProvider.notifier).update = File(recentFile.path!);
                                  await fadePush(context, const PdfDetail());
                                },
                              ),
                            );
                          },
                        ),
                      );
                    },
                    error: (e, s) => const Text('err'),
                    loading: () => const Text('Loading'),
                  ),
            ),
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
    if (!Platform.isAndroid) return;
    final pickedPlatformFile = await pickPDF();
    if (pickedPlatformFile == null) return;
    final pickedFile = File(pickedPlatformFile.path!);
    await updateDB(pickedFile);

    ref.read(selectedPDFProvider.notifier).update = pickedFile;

    if (!context.mounted) return;
    context.push(const PdfDetail());
    if (!context.mounted) return;
  }
}
