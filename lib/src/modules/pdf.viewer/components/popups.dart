import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';

import 'meaning.display.widget.dart';

Future<void> showMeaningDialog(WidgetRef ref, BuildContext context, WordMeaning meaning) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: MeaningDisplayWidget(meaning: meaning),
      );
    },
  );
}

Future showMeaningBottomSheet(BuildContext context, WordMeaning meaning) async {
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: MeaningDisplayWidget(meaning: meaning),
      );
    },
    isScrollControlled: true,
  );
}
