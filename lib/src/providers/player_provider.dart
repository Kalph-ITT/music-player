import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerProvider extends StateNotifier<AudioPlayer> {
  PlayerProvider() : super(AudioPlayer());

  Future setUrl(String url) async {
    await state.setUrl(url);
  }
}

final playerProvider = StateNotifierProvider<PlayerProvider, AudioPlayer>(
  (ref) {
    return PlayerProvider();
  },
);
