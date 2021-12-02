import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const CircleButton(
      {Key? key,
      required this.icon,
      required this.iconSize,
      required this.onPressed,
      required this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ),
    );
  }
}
