import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/extensions/extensions.dart';
import 'package:read_it/src/modules/home.dart/models/opened.file.detail.dart';
import 'package:read_it/src/modules/pdf.viewer/provider/detail.provider.dart';
import 'package:read_it/src/modules/pdf.viewer/view/pdf.viewer.dart';

import '../../provider/home.provider.dart';
import 'recent.file.tile.dart';

class RecentFileList extends ConsumerWidget {
  const RecentFileList({super.key, this.recentFiles});
  final List<RecentFile>? recentFiles;
  @override
  Widget build(BuildContext context, ref) {
    return ref.watch(recentFilesProvider).when(
          data: (recentFiles) {
            return ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                recentFiles.length,
                (index) {
                  final recentFile = recentFiles[index];
                  return RecentFileTile(
                    file: recentFile,
                    onPressed: () async {
                      ref.read(selectedPDFProvider.notifier).update = File(recentFile.path!);
                      context.push(const ScyncfuncitonPdfDetail());
                    },
                  );
                },
              ),
            );
          },
          error: (e, s) => const Text('err'),
          loading: () => const Text('Loading'),
        );
  }
}
