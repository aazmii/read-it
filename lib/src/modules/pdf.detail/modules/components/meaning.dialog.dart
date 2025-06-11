import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pattern_m/src/extensions/extensions.dart';
import 'package:pattern_m/src/modules/dictionary/model/word.meaning.dart';

Future<void> showMeaningDialog(WidgetRef ref, BuildContext context, WordMeaning meaning) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: MeaningDialog(meaning: meaning),
      );
    },
  );

  // ref.invalidate(meaningProvider);
}

class MeaningDialog extends StatelessWidget {
  const MeaningDialog({super.key, required this.meaning});
  final WordMeaning meaning;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: SizedBox(
          height: context.height * 0.5,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: CustomTextField(text: meaning.en),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.speaker_rounded),
                    Icon(Icons.copy),
                    Icon(Icons.add),
                    Icon(Icons.send),
                  ],
                ),
              ),
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text, this.readOnly, this.showLoader = false});
  final String text;
  final bool? readOnly, showLoader;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Stack(
        children: [
          TextFormField(
            initialValue: text,
            expands: true,
            maxLines: null,
            textAlignVertical: TextAlignVertical.top,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
            ),
          ),
          if (showLoader!) const Center(child: CircularProgressIndicator())
        ],
      ),
    );
  }
}
