import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/src/models/music.dart';

class PlayerProvider extends StateNotifier<Music> {
  final player = AudioPlayer();
  PlayerProvider() : super(Music(title: '', url: '', duration: 0.0));

  Future setUrl(String url) async {
    await player.setUrl(url);
    double duration = player.duration?.inSeconds.toDouble() ?? 0.0;
    state = Music(title: state.title, url: url, duration: duration);
  }

  Stream<Duration> getCurrentPosition() {
    return player.positionStream;
  }

  getPlayer() => player;
}

final playerProvider =
    StateNotifierProvider<PlayerProvider, Music>((ref) => PlayerProvider());
