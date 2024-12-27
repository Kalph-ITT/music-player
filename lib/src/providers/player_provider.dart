import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class PlayerProvider extends StateNotifier<AudioPlayer> {
  PlayerProvider() : super(AudioPlayer());

  Future setAudioSource(
      {required String url,
      required String id,
      required String title,
      required Duration duration}) async {
    await state.setAudioSource(
      AudioSource.uri(
        Uri.parse(url),
        tag: MediaItem(
          id: id,
          title: title,
          duration: duration,
        ),
      ),
    );
  }
}

final playerProvider = StateNotifierProvider<PlayerProvider, AudioPlayer>(
  (ref) {
    return PlayerProvider();
  },
);
