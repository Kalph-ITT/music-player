import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_player/src/routes/routes.dart';
import 'package:music_player/src/theme/theme.dart';

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.example.music_player.channel.audio',
    androidNotificationChannelName: 'Music Playback',
    androidNotificationOngoing: true,
    androidNotificationClickStartsActivity: true,
  );
  print("JustAudioBackground initialized.");
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Music player',
      theme: AppTheme.getCurrentTheme,
      routerConfig: AppRouter.router,
    );
  }
}
