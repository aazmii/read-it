import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:read_it/src/core/providers/isar.provider.dart';

import '../../../features/setting/model/setting.model.dart';
import '../../../features/setting/provider/settings.provider.dart';
import '../model/theme.model.dart';

typedef ThemeNotifier = NotifierProvider<ThemeProvider, ThemeProfile>;
final themeProvider = ThemeNotifier(ThemeProvider.new);

class ThemeProvider extends Notifier<ThemeProfile> {
  @override
  ThemeProfile build() => ref.watch(settingsProvider.select((v) => v.theme));

  ThemeProfile get theme => state;
  Future<void> changeTheme(ThemeProfile theme) async {
    final db = ref.read(isarServiceProvider).db;
    await db.writeTxn(() async {
      final setting = await db.appSettings.where().findFirst();
      if (setting != null) {
        setting.theme = theme;
        await db.appSettings.put(setting);
      }
    });
  }

  // Future<void> changeTheme(ThemeProfile theme) async => await compute(
  //       _changeTheme,
  //       _Data(ref.read(settingsProvider), theme),
  //     );

  Future<void> toggleTheme() async => await changeTheme(state.toggled);
}

// void _changeTheme(_Data data) {
//   isarService.openDBSync(data.dir);
//   data.setting.theme = data.theme;
//   isarService.db.writeTxnSync(() => isarService.db.appSettings.putSync(data.setting));
// }

// class _Data {
//   _Data(this.setting, this.theme);

//   final AppDir dir = appDir;
//   final ThemeProfile theme;
//   final AppSetting setting;
// }
