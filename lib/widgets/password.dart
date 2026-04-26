import 'package:flutter/material.dart';
import 'MyTextField.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.passwordController,
    required this.isVisible,
    required this.onTogglePassword,
  });

  final TextEditingController passwordController;
  final bool isVisible;
  final VoidCallback onTogglePassword;

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      prefix: Icons.lock,
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      hintText: 'Password',
      obscureText: !isVisible,
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: onTogglePassword,
      ),
    );
  }
}
