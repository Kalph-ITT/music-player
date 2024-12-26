import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/src/models/music.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlayerProvider extends StateNotifier<Music> {
  final AudioPlayer player = AudioPlayer();
  PlayerProvider()
      : super(
          Music(title: '', url: '', duration: 0.0, artist: '', id: 0),
        );

  Future setUrl(String url) async {
    await player.setUrl(url);
    if (state.duration == 0.0) {
      double duration = player.duration?.inSeconds.toDouble() ?? 0.0;
      state = Music(
        title: state.title,
        url: url,
        duration: duration,
        id: state.id,
        artist: state.artist,
      );
    }

    state = Music(
        id: state.id,
        title: state.title,
        url: url,
        duration: state.duration,
        artist: state.artist);
  }

  Stream<Duration> getCurrentPosition() {
    return player.positionStream;
  }

  void setMusicMetaData(SongModel song) {
    state = Music(
      id: song.id,
      title: song.title,
      url: state.url,
      duration: state.duration,
      artist: song.artist ?? 'unknown',
    );
  }

  AudioPlayer getPlayer() => player;
}

final playerProvider =
    StateNotifierProvider<PlayerProvider, Music>((ref) => PlayerProvider());
