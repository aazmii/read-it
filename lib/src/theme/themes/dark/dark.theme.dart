import 'package:flutter/material.dart';
import 'package:pattern_m/src/theme/themes/themes.dart';

ThemeData get darkTheme => ThemeData(
      visualDensity: VisualDensity.compact,
      colorSchemeSeed: Colors.teal,
      brightness: Brightness.dark,
      useMaterial3: true,
      inputDecorationTheme: inputDecorationTheme,
    );
