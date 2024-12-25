import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  final String title;
  final String artist;
  const MusicTile({super.key, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(title, style: Theme.of(context).textTheme.bodyMedium),
        Text(artist, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
