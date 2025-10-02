import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/modules/dictionary/model/word.meaning.dart';
import 'package:read_it/src/modules/dictionary/model/word.model/word.model.dart';

import 'meaning.display.widget/meaning.display.widget.dart';

Future<void> showMeaningDialog(WidgetRef ref, BuildContext context, WordModel word, {Translation? meaning}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: MeaningDisplayWidget(word: word),
      );
    },
  );
}

Future showMeaningBottomSheet(BuildContext context, WordModel word) async {
  await showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: MeaningDisplayWidget(word: word),
      );
    },
    isScrollControlled: true,
  );
}
