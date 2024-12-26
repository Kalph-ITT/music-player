import 'package:flutter/material.dart';

class PlayerSeek extends StatefulWidget {
  const PlayerSeek({super.key});

  @override
  _PlayerSeekState createState() => _PlayerSeekState();
}

class _PlayerSeekState extends State<PlayerSeek> {
  bool isShuffle = false;
  double _currentSliderValue = 0.0;
  Duration _currentPosition = Duration.zero;
  final Duration _totalDuration = Duration(minutes: 3);

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _currentSliderValue,
          min: 0.0,
          max: _totalDuration.inSeconds.toDouble(),
          onChanged: (value) {
            setState(() {
              _currentSliderValue = value;
              _currentPosition = Duration(seconds: value.toInt());
            });
            // Add logic to seek the music to the new position
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_formatDuration(_currentPosition)),
            Text(_formatDuration(_totalDuration)),
          ],
        ),
      ],
    );
  }
}
