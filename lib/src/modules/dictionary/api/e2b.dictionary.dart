import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:read_it/src/modules/dictionary/model/e2bdictionary.dart';

late final E2BDictionary e2bDictionary;

Future<void> initE2BDictionary() async {
  final jsonResponse = await rootBundle.loadString('assets/dictionary/E2Bdatabase.json');
  e2bDictionary = await compute((v) => E2BDictionary.fromJson(jsonResponse), null);
}
