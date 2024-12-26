import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/src/providers/player_provider.dart';
import 'package:music_player/src/utils/duration_formatter.dart';

class PlayerSeek extends ConsumerStatefulWidget {
  const PlayerSeek({super.key});

  @override
  PlayerSeekState createState() => PlayerSeekState();
}

class PlayerSeekState extends ConsumerState<PlayerSeek> {
  bool isShuffle = false;
  double _currentSliderValue = 0.0;
  Duration _currentPosition = Duration.zero;

  @override
  initState() {
    super.initState();
    getCurrentDuration();
  }

  getTotalDuration() {
    var totalSeconds = ref.watch(playerProvider).duration;
    return Duration(seconds: totalSeconds.toInt());
  }

  void getCurrentDuration() {
    final stream = ref.read(playerProvider.notifier).getCurrentPosition();
    stream.listen((event) {
      setState(() {
        _currentPosition = event;
        _currentSliderValue = event.inSeconds.toDouble();
      });
    });
  }

  void seekMusic(value) {
    setState(() {
      _currentSliderValue = value;
      _currentPosition = Duration(seconds: value.toInt());

      ref.read(playerProvider.notifier).getPlayer().seek(_currentPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalDuration = getTotalDuration();
    return Column(
      children: [
        Slider(
          value: _currentSliderValue,
          min: 0.0,
          max: totalDuration.inSeconds.toDouble(),
          onChanged: seekMusic,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(formatDuration(_currentPosition)),
            Text(formatDuration(totalDuration)),
          ],
        ),
      ],
    );
  }
}
