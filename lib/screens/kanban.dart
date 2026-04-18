import 'package:flutter/material.dart';

class KanbanPage extends StatelessWidget {
  const KanbanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kanban Board')),
      body: const Center(
        child: Text('Welcome to Kanban!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
