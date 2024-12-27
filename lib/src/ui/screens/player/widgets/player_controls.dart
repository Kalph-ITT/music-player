import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/src/enum/repeat.dart';
import 'package:music_player/src/providers/player_provider.dart';

class PlayerControls extends ConsumerStatefulWidget {
  const PlayerControls({super.key});

  @override
  PlayerControlsState createState() => PlayerControlsState();
}

class PlayerControlsState extends ConsumerState<PlayerControls> {
  bool isShuffle = false;
  bool isMusicPlaying = false;
  RepeatMode repeatMode = RepeatMode.RepeatNone;

  @override
  void initState() {
    super.initState();
    isMusicPlaying = ref.read(playerProvider).playing;
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

  IconButton getRepeatModeIcon() {
    AudioPlayer player = ref.read(playerProvider);
    switch (repeatMode) {
      case RepeatMode.RepeatAll:
        return IconButton(
          iconSize: 30,
          color: Theme.of(context).colorScheme.surfaceTint,
          icon: Icon(Icons.repeat),
          onPressed: () {
            player.setLoopMode(LoopMode.one);
            setState(() {
              repeatMode = RepeatMode.RepeatOne;
            });
          },
        );

      case RepeatMode.RepeatOne:
        return IconButton(
          iconSize: 30,
          color: Theme.of(context).colorScheme.surfaceTint,
          icon: Icon(Icons.repeat_one),
          onPressed: () {
            player.setLoopMode(LoopMode.off);
            setState(() {
              repeatMode = RepeatMode.RepeatNone;
            });
          },
        );

      case RepeatMode.RepeatNone:
        return IconButton(
          iconSize: 30,
          color: Theme.of(context).colorScheme.surfaceBright,
          icon: Icon(Icons.repeat),
          onPressed: () {
            setState(() {
              player.setLoopMode(LoopMode.all);
              repeatMode = RepeatMode.RepeatAll;
            });
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 30,
              color: isShuffle
                  ? Theme.of(context).colorScheme.surfaceTint
                  : Theme.of(context).colorScheme.surfaceBright,
              icon: Icon(Icons.shuffle),
              onPressed: () {
                setState(() {
                  isShuffle = !isShuffle;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 40,
                  color: Theme.of(context).colorScheme.surfaceBright,
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 80,
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icon(isMusicPlaying
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_filled),
                  onPressed: playPause,
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  iconSize: 40,
                  icon: Icon(Icons.skip_next),
                  onPressed: () {},
                ),
              ],
            ),
            getRepeatModeIcon()
          ],
        ),
      ],
    );
  }
}
