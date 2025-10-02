
import 'package:flutter/material.dart';
import 'package:read_it/src/extensions/extensions.dart';
import 'package:read_it/src/modules/dictionary/model/word.model/word.model.dart';

class MeaningTile extends StatelessWidget {
  const MeaningTile({super.key, required this.index, required this.meaning});
  final int index;
  final Meaning meaning;
  @override
  Widget build(BuildContext context) {
    final pop = meaning.partOfSpeech != null ? '(${meaning.partOfSpeech?.capitalize})' : '';
    final def = meaning.definitions?.first.definition?.capitalize ?? '';
    final examp = meaning.definitions?.first.example;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${index + 1}.'),
          10.toWidth,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('$pop $def'), if (examp != null) Text('Example: $examp')],
            ),
          )
        ],
      ),
    );
    // return ListTile(
    //   leading: Text('${index + 1}'),
    //   title: Text('$pop $def'),
    //   subtitle: examp != null ? Text('Example: $examp') : null,
    // );
  }
}
