import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({super.key, required this.isVisible});

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox();

    return const Text(
      'Invalid email or password',
      style: TextStyle(color: Colors.red, fontSize: 14),
    );
  }
}
