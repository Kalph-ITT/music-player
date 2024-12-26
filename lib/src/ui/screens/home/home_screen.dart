import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player/src/providers/player_provider.dart';
import 'package:music_player/src/routes/route_constants.dart';
import 'package:music_player/src/services/home_service.dart';

import 'package:music_player/src/ui/screens/home/widgets/music_tile.dart';
import 'package:music_player/src/ui/screens/home/widgets/music_tile_full.dart';
import 'package:music_player/src/ui/screens/home/widgets/recently_played.dart';
import 'package:music_player/src/ui/widgets/bottom_player.dart';
import 'package:music_player/src/ui/widgets/header.dart';
import 'package:music_player/src/ui/widgets/pill_button.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<SongModel> songs = [];

  @override
  void initState() {
    super.initState();

    HomeService().scanFiles().then((value) {
      setState(() {
        songs = value;
      });
    });
  }

  void onTapMusicTile(SongModel song) async {
    if (song.uri == null) return;
    ref.read(playerProvider.notifier).setMusicMetaData(song);
    ref.read(playerProvider.notifier).setUrl(song.uri!);
    GoRouter.of(context).pushNamed(RouteConstants.player);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomPlayer(),
      appBar: Header(
        title: 'Music player',
      ),
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
                    onTap: () {
                      HomeService().scanFiles();
                    },
                  ),
                  PillButton(
                    label: 'Play',
                    icon: Icons.play_circle,
                    onTap: () {
                      GoRouter.of(context).pushNamed(RouteConstants.player);
                    },
                  ),
                ],
              ),
              HomePlayedSection(
                title: 'Your Music',
                child: songs.map((song) {
                  return MusicTile(
                    onTap: () {
                      onTapMusicTile(song);
                    },
                    song: song,
                  );
                }).toList(),
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
