import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/src/models/music.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongProviderNotifier extends StateNotifier<Music> {
  SongProviderNotifier()
      : super(
          Music(title: '', url: '', duration: 0.0, artist: '', id: 0),
        );

  void setUrl(String url) {
    state = state.copyWith(url: url);
  }

  void setMusicMetaData(SongModel song) {
    state = state.copyWith(
      id: song.id,
      title: song.title,
      artist: song.artist ?? 'unknown',
    );
  }
}

final songProvider = StateNotifierProvider<SongProviderNotifier, Music>(
  (ref) => SongProviderNotifier(),
);
