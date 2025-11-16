import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  final String message;
  final IconData icon;
  

  const EmptyCard({
    required this.message,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
