import 'package:caption/src/styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getThemeData() {
    final theme = ThemeData(
      primarySwatch: Colors.blue,
    );

    return theme.copyWith(
      inputDecorationTheme: const InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.all(Insets.m),
        border: OutlineInputBorder(),
      ),
    );
  }
}
