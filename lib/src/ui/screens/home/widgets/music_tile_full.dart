import 'package:flutter/material.dart';

class MusicTileFull extends StatelessWidget {
  final String title;
  final String artist;
  const MusicTileFull({super.key, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 19),
      decoration: BoxDecoration(
        color: const Color.fromARGB(115, 58, 57, 57),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
          Text(artist, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
