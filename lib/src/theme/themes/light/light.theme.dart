import 'package:flutter/material.dart';

import '../themes.dart';

ThemeData get lightTheme => ThemeData(
    visualDensity: VisualDensity.compact,
    colorSchemeSeed: Colors.teal,
    brightness: Brightness.light,
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.grey[300],
    appBarTheme: AppBarTheme(backgroundColor: Colors.grey[300]),
    inputDecorationTheme: inputDecorationTheme);
