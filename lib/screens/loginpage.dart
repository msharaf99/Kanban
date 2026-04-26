import 'package:flutter/material.dart';
import 'package:kanban/widgets/MyKanban.dart';
import 'kanban.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: MyKanban()),
      ),
    );
  }
}
