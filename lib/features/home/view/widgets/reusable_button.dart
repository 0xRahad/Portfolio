import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;

  const ReusableButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(minimumSize: Size(100, 50)),
      icon: icon != null ? Icon(icon, color: Colors.white) : SizedBox.shrink(),
      label: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}