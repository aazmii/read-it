import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/features/translation/presentaion/providers/languages.provider.dart';

import 'language.tile.dart';

class AvailableLanguagesView extends StatefulWidget {
  const AvailableLanguagesView({super.key});

  @override
  State<AvailableLanguagesView> createState() => _AvailableLanguagesViewState();
}

class _AvailableLanguagesViewState extends State<AvailableLanguagesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Languages')),
      body: Consumer(
        builder: (context, ref, child) {
          final availablLangs = ref.watch(languagesProvider);
          return availablLangs.when(
            data: (langs) {
              return ListView.builder(
                itemCount: langs.length,
                itemBuilder: (context, i) {
                  final lang = langs[i];
                  return LanguageTile(
                    title: lang.name,
                    t: () {
                      lang.isDownloaded ? _deleteModel(ref, lang.code) : _downloadModel(ref, lang.code);
                    },
                    isDownloaded: lang.isDownloaded,
                    isBusy: false,
                  );
                },
              );
            },
            error: (e, s) => Center(child: Text(e.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Future _downloadModel(WidgetRef ref, String code) async {
    await ref.read(languagesProvider.notifier).downloadLanguage(code);
  }

  Future _deleteModel(WidgetRef ref, String code) async {
    return await ref.read(languagesProvider.notifier).downloadLanguage(code);
  }
}
