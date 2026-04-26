import 'package:flutter/material.dart';
import 'MyTextField.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      prefix: Icons.person,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      hintText: 'Email',
    );
  }
}
