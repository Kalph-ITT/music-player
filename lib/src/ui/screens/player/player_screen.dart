import 'package:flutter/material.dart';
import 'package:music_player/src/ui/screens/player/widgets/album_art.dart';
import 'package:music_player/src/ui/screens/player/widgets/player_controls.dart';
import 'package:music_player/src/ui/screens/player/widgets/player_seek.dart';
import 'package:music_player/src/ui/widgets/header.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Player',
      ),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlbumArt(),
              SizedBox(
                height: 20,
              ),
              PlayerSeek(),
              PlayerControls()
            ],
          ),
        ),
      ),
    );
  }
}
