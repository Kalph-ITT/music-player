import 'package:flutter/material.dart';

class HomePlayedSection extends StatelessWidget {
  final String title;
  final List<Widget> child;

  const HomePlayedSection(
      {super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        spacing: 30,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          Row(
            spacing: 20,
            children: child,
          )
        ],
      ),
    );
  }
}
