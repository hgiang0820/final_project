import 'package:flutter/material.dart';

class IconAndButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Icon icon;
  final Color? color;

  const IconAndButton({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.purple[300],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
