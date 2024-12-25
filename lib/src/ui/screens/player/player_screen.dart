import 'package:flutter/material.dart';
import 'package:music_player/src/ui/widgets/header.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Song name',
      ),
      body: Center(
        child: Text('Player Screen'),
      ),
    );
  }
}
