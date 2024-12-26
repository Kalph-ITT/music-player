import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicTile extends StatelessWidget {
  final SongModel song;
  final void Function() onTap;
  const MusicTile({
    super.key,
    required this.song,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          QueryArtworkWidget(
            id: song.id,
            type: ArtworkType.AUDIO,
            artworkBorder: BorderRadius.circular(5),
            nullArtworkWidget: Icon(
              Icons.music_note,
              size: 50,
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 100,
            child: Text(
              song.title,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Text(song.artist ?? 'unknown',
              style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
