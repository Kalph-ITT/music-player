import 'package:flutter/material.dart';

class BottomPlayer extends StatelessWidget {
  const BottomPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: const Color.fromARGB(255, 16, 16, 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: Theme.of(context).textTheme.bodyMedium),
              Text('Artist', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Spacer(),
          IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.play_arrow,
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
            onPressed: () {},
          ),
          IconButton(
            iconSize: 40,
            icon: Icon(
              Icons.skip_next,
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
