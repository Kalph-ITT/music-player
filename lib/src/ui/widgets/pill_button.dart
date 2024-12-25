import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const PillButton({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Theme.of(context).colorScheme.onSurfaceVariant),
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }
}
