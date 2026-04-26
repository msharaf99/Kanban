import 'package:flutter/material.dart';
import 'logo_widget.dart';
import 'email.dart';
import 'password.dart';
import 'error_text.dart';
import 'login_cancel.dart';
import '../screens/kanban.dart';

class MyKanban extends StatefulWidget {
  const MyKanban({super.key});

  @override
  State<MyKanban> createState() => _MyKanbanState();
}

class _MyKanbanState extends State<MyKanban> {
  bool isVisible = false;
  bool invalidLogin = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? validateLogin(String email, String password) {
    if (email == 'admin' && password == 'pass') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const KanbanBoardPage(username: 'admin'),
        ),
      );
      return null;
    } else {
      return 'Invalid email or password';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LogoWidget(),

          const SizedBox(height: 50),

          EmailField(emailController: emailController),

          const SizedBox(height: 20),

          PasswordField(
            passwordController: passwordController,
            isVisible: isVisible,
            onTogglePassword: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
          ),

          const SizedBox(height: 20),

          ErrorTextWidget(isVisible: invalidLogin),

          const SizedBox(height: 20),

          LoginCancelButtons(
            onLogin: () {
              final result = validateLogin(
                emailController.text,
                passwordController.text,
              );

              setState(() {
                invalidLogin = result != null;
              });
            },
            onCancel: () {
              emailController.clear();
              passwordController.clear();

              setState(() {
                isVisible = false;
                invalidLogin = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
