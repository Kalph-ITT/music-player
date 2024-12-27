import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/src/models/music.dart';
import 'package:music_player/src/providers/player_provider.dart';
import 'package:music_player/src/providers/song_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class BottomPlayer extends ConsumerStatefulWidget {
  const BottomPlayer({super.key});

  @override
  ConsumerState<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends ConsumerState<BottomPlayer> {
  bool isMusicPlaying = false;

  @override
  void initState() {
    isMusicPlaying = ref.read(playerProvider).playing;
    super.initState();
  }

  void playPause() async {
    bool isPlaying = ref.read(playerProvider).playing;

    setState(() {
      isMusicPlaying = !isPlaying;
    });

    if (isPlaying) {
      await ref.read(playerProvider).pause();
    } else {
      await ref.read(playerProvider).play();
    }
  }

  @override
  Widget build(BuildContext context) {
    Music music = ref.read(songProvider);
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 16, 16, 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          QueryArtworkWidget(
            id: music.id,
            type: ArtworkType.AUDIO,
            artworkWidth: 50,
            artworkHeight: 50,
            artworkBorder: BorderRadius.circular(5),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  music.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Text(music.artist, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Spacer(),
          IconButton(
            iconSize: 40,
            icon: Icon(
              isMusicPlaying ? Icons.pause : Icons.play_arrow,
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
            onPressed: playPause,
          ),
          IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.skip_next,
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
