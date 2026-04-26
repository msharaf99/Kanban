import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text; // button text
  final VoidCallback onPressed; // function when clicked
  final Color color; // button color

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF3568B5),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
