import 'package:flutter/material.dart';
import 'Mybutton.dart';

class LoginCancelButtons extends StatelessWidget {
  const LoginCancelButtons({
    super.key,
    required this.onLogin,
    required this.onCancel,
  });

  final VoidCallback onLogin;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyButton(
            text: 'Login',
            onPressed: onLogin,
            color: const Color(0xFF3568B5),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: MyButton(
            text: 'Cancel',
            onPressed: onCancel,
            color: const Color(0xFF3568B5),
          ),
        ),
      ],
    );
  }
}
