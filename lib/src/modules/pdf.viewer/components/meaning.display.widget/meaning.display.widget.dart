import 'package:flutter/material.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';

import 'action.panel.dart';
import 'custom.textfield.dart';

class MeaningDisplayWidget extends StatelessWidget {
  const MeaningDisplayWidget({super.key, required this.meaning});
  final Translation meaning;
  @override
  Widget build(BuildContext context) {
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
                    Expanded(child: CustomTextField(text: meaning.en)),
                    ActionPanel(meaning: meaning),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: CustomTextField(
                text: meaning.bn,
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
