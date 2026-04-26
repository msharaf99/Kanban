import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget {
  final IconData prefix;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry padding;
  final bool filled;

  const MyTextField({
    super.key,
    required this.prefix,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 25.0),
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          filled: filled,
          prefixIcon: Icon(prefix),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
