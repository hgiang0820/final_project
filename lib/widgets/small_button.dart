import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final bool isSelected;
  final double? fontSize;

  const SmallButton({
    required this.onPressed,
    required this.title,
    this.height,
    this.isSelected = false,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(
          height ?? 50, // if height is null, the defualt value is 50
        ),
        padding: EdgeInsets.all(5),
        backgroundColor: isSelected ? Colors.purple[500] : Colors.purple[200],
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: fontSize ?? 13),
      ),
    );
  }
}
