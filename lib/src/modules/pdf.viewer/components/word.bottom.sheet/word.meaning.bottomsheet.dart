import 'package:flutter/material.dart';
import 'package:read_it/src/core/extensions/extensions.dart';
import 'package:read_it/src/modules/dictionary/model/word.model/word.model.dart';

import 'meaning.tile.dart';

Future showWordBottomSheet(BuildContext context, WordModel word) async {
  await showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) => WordMeaningBttomsheetBody(word: word),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
  );
}

class WordMeaningBttomsheetBody extends StatelessWidget {
  const WordMeaningBttomsheetBody({super.key, required this.word});
  final WordModel word;

  @override
  Widget build(BuildContext context) {
    return _MakeDismissible(
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        maxChildSize: 0.6,
        minChildSize: 0.3,
        builder: (context, controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: context.theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  word.word?.capitalize ?? '',
                                  style: context.text.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                6.toWidth,
                                Text(word.phonetic ?? ''),
                              ],
                            ),
                          ),
                        ),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.copy)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.bookmark)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.send)),
                      ],
                    ),
                    const Text('Antonyms', style: TextStyle(fontStyle: FontStyle.italic)),
                    const Divider(),
                    const Text('Antonym1, Antonym 2, Antonym 3'),
                    20.toHeight,
                    const Text('Meanings', style: TextStyle(fontStyle: FontStyle.italic)),
                    const Divider(),
                    ...List.generate(word.meanings?.length ?? 0, (i) {
                      return MeaningTile(index: i, meaning: word.meanings![i]);
                    })
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MakeDismissible extends StatelessWidget {
  const _MakeDismissible({required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: context.pop,
      child: GestureDetector(onTap: () {}, child: child),
    );
  }
}
