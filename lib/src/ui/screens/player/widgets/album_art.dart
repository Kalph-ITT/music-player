import 'package:flutter/material.dart';

class AlbumArt extends StatelessWidget {
  const AlbumArt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: 250,
          color: Theme.of(context).colorScheme.primary,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Title Name',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text('Artist Name', style: Theme.of(context).textTheme.titleMedium!),
      ],
    );
  }
}
