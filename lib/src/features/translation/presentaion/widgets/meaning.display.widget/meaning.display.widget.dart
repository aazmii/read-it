import 'package:flutter/material.dart';
import 'package:read_it/src/core/extensions/extensions.dart';
import 'package:read_it/src/features/translation/data/models/word.model/word.model.dart';

import 'action.panel.dart';
import 'custom.textfield.dart';

class MeaningDisplayWidget extends StatelessWidget {
  const MeaningDisplayWidget({super.key, required this.word});
  final WordModel word;
  @override
  Widget build(BuildContext context) {
    final firstMeaning = word.meanings != null && word.meanings!.isNotEmpty ? word.meanings?.first : null;
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: SizedBox(
        height: context.height * 0.58,
        child: Column(
          children: [
            const SizedBox(width: 100, child: Divider(thickness: 2)),
            const SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CustomTextField(text: word.word!)),
                    ActionPanel(text: word.word),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: CustomTextField(
                text: firstMeaning?.definitions?.first.definition ?? '',
                // text:  word.meanings?.isNotEmpty? word.meanings?.first.definitions?.first.definition ?? '',
                readOnly: true,
                // showLoader: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
