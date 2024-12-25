import 'package:flutter/material.dart';
import 'package:music_player/src/theme/text_theme.dart';

class AppTheme {
  static ThemeData get getCurrentTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      textTheme: AppTextTheme.textTheme,
    );
  }
}
