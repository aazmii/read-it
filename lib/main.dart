import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderScope;
import 'package:read_it/src/core/db/isar.service.dart';
import 'package:read_it/src/core/providers/isar.provider.dart';
import 'package:read_it/src/features/dictionary/api/e2b.dictionary.dart';

import 'src/app.dart' show MyApp;

// late final IsarService isarService;
void main() async {
  final service = IsarService();
  await service.openDB();

  await _init().then(
    (_) => runApp(
      ProviderScope(
        overrides: [isarServiceProvider.overrideWithValue(service)],
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initE2BDictionary();
}
