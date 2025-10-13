import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_it/src/core/db/isar.service.dart';

import '../model/setting.model.dart';
// TODO: Cean it, remove global varialble
final isarService = IsarService();
final _settingsStream = isarService.db.appSettings.watchObject(0, fireImmediately: true);
final _settingsStreamProvider = StreamProvider((_) => _settingsStream);

typedef AppSettingsNotifier = NotifierProvider<SettingProvider, AppSetting>;
final settingsProvider = AppSettingsNotifier(SettingProvider.new);

class SettingProvider extends Notifier<AppSetting> {
  @override
  AppSetting build() => ref.watch(_settingsStreamProvider).value ?? AppSetting();
}
