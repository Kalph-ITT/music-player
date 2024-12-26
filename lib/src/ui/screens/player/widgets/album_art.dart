import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_player/src/models/music.dart';
import 'package:music_player/src/providers/player_provider.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumArt extends ConsumerWidget {
  const AlbumArt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Music music = ref.watch(playerProvider);
    return Column(
      children: [
        QueryArtworkWidget(
          artworkHeight: 250,
          artworkWidth: 250,
          id: music.id,
          type: ArtworkType.AUDIO,
          artworkBorder: BorderRadius.circular(5),
          nullArtworkWidget: Icon(
            Icons.music_note,
            size: 50,
            color: Theme.of(context).colorScheme.surfaceBright,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          music.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(music.artist, style: Theme.of(context).textTheme.titleMedium!),
      ],
    );
  }
}
