import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/pdf.viewer/provider/detail.provider.dart';

class PdfDetail extends ConsumerWidget {
  const PdfDetail({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final currentPage = ref.watch(pageNumProvider);
    final notifier = ref.read(pageNumProvider.notifier);
    // final readMode = ref.watch(readModeProvider);

    return Scaffold(
      appBar: AppBar(
        actions: ref.watch(selectedPDFProvider) != null
            ? [
                Text('$currentPage ', style: context.text.titleLarge),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: notifier.previous,
                ),
                IconButton(icon: const Icon(Icons.arrow_forward_ios), onPressed: notifier.next),
              ]
            : [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
        // child: readMode == Mode.normal
        //     ? const PdfViewWidget()
        //     : const AssistView(),
        // : const PdfContent(),
      ),
    );
  }
}
