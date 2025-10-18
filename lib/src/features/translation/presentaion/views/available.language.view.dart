import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/features/translation/presentaion/providers/get.lang.provider.dart';

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
          final availablLangs = ref.watch(availableLanguagesProvider);
          return availablLangs.when(
            data: (langs) {
              return ListView.builder(
                itemCount: langs.length,
                itemBuilder: (context, i) {
                  final lang = langs[i];
                  return LanguageTile(
                    title: lang.name,
                    t: () {
                      lang.isDownloaded ? _deleteModel(lang.code) : _downloadModel(lang.code);
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

  Future<String> _downloadModel(String code) async {
    await Future.delayed(Durations.extralong4);
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      content: Text('Downloading $code'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
        )
      ],
    ));
    return getSuccess(code);
  }

  Future<String> _deleteModel(String code) async {
    return '';
  }

  Future<String> getSuccess(String t) async {
    await Future.delayed(Durations.extralong4);
    return 'yo';
  }
}
