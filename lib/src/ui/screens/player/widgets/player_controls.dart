import 'package:flutter/material.dart';

class PlayerControls extends StatefulWidget {
  const PlayerControls({super.key});

  @override
  _PlayerControlsState createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(
          height: 30,
        ),
        Container(
          height: 10,
          width: double.infinity,
          color: Colors.red,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text('0:00'),
            Spacer(),
            Text('3:00'),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 30,
              color: Theme.of(context).colorScheme.surfaceBright,
              icon: Icon(Icons.replay_10),
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 40,
                  color: Theme.of(context).colorScheme.surfaceBright,
                  icon: Icon(Icons.skip_previous),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 80,
                  color: Theme.of(context).colorScheme.primary,
                  icon: Icon(Icons.play_circle_filled_outlined),
                  onPressed: () {},
                ),
                IconButton(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  iconSize: 40,
                  icon: Icon(Icons.skip_next),
                  onPressed: () {},
                ),
              ],
            ),
            IconButton(
              iconSize: 30,
              color: Theme.of(context).colorScheme.surfaceBright,
              icon: Icon(Icons.forward_10),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
