import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/core/extensions/extensions.dart';
import 'package:read_it/src/features/pdf.reader/domain/entities/readable.file.dart';
import 'package:read_it/src/features/pdf.reader/presentation/views/home.page/recent.files.section/recent.file.tile.dart';

import '../../../provider/home.provider.dart';
import '../../pdf.view.page/pdf.view.page.dart';

/// Only appears when there are recent files
class RecentFileList extends ConsumerWidget {
  const RecentFileList({super.key, this.recentFiles});
  final List<ReadableFileEntity>? recentFiles;
  @override
  Widget build(BuildContext context, ref) {
    final recentFiles = ref.watch(recentFilesProvider).valueOrNull;
    if (recentFiles == null || recentFiles.isEmpty) return const SizedBox.shrink();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Recently Opened', style: context.text.titleMedium), const Icon(Icons.arrow_forward_ios)],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              recentFiles.length,
              (index) {
                final recentFile = recentFiles[index];
                return RecentFileTile(
                  file: recentFile,
                  onPressed: () async {
                    // ref.read(selectedPDFProvider.notifier).update = File(recentFile.path!);
                    context.push(ScyncfuncitonPdfDetail(file: File(recentFile.path)));
                  },
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
