import 'package:flutter/material.dart';
import 'package:music_player/src/ui/screens/home/widgets/music_tile.dart';
import 'package:music_player/src/ui/screens/home/widgets/music_tile_full.dart';
import 'package:music_player/src/ui/screens/home/widgets/recently_played.dart';
import 'package:music_player/src/ui/widgets/bottom_player.dart';
import 'package:music_player/src/ui/widgets/header.dart';
import 'package:music_player/src/ui/widgets/pill_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomPlayer(),
      appBar: Header(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PillButton(
                    label: 'Scan music',
                    icon: Icons.audio_file,
                  ),
                  PillButton(
                    label: 'Scan music',
                    icon: Icons.play_circle,
                  ),
                ],
              ),
              HomePlayedSection(
                title: 'Recently Played',
                child: [
                  MusicTile(
                    title: 'Song Title',
                    artist: 'Artist Name',
                  ),
                  MusicTile(
                    title: 'Song Title',
                    artist: 'Artist Name',
                  ),
                  MusicTile(
                    title: 'Song Title',
                    artist: 'Artist Name',
                  ),
                ],
              ),
              HomePlayedSection(
                title: 'Most played',
                child: [
                  MusicTileFull(
                    title: 'Song Title',
                    artist: 'Artist Name',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
