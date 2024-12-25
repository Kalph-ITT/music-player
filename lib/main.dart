import 'package:flutter/material.dart';
import 'package:music_player/src/theme/theme.dart';
import 'package:music_player/src/ui/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music player',
      theme: AppTheme.getCurrentTheme,
      home: const HomeScreen(),
    );
  }
}
