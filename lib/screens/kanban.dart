import 'package:flutter/material.dart';
import 'package:kanban/widgets/kanban_body.dart';

class KanbanBoardPage extends StatefulWidget {
  const KanbanBoardPage({super.key, required this.username});

  final String username;

  @override
  State<KanbanBoardPage> createState() => _KanbanBoardPageState();
}

class _KanbanBoardPageState extends State<KanbanBoardPage> {
  final TextEditingController columnName = TextEditingController();

  List<Task> items = [];

  void addColumn() {
    if (columnName.text.isEmpty) return;

    Task task = Task();
    task.title = columnName.text;

    items.add(task);
    columnName.clear();

    setState(() {});
  }

  void addSubtask(int columnIndex) {
    if (items[columnIndex].subtaskController.text.isEmpty) return;

    items[columnIndex].subtasks.add(
      Subtask(title2: items[columnIndex].subtaskController.text),
    );

    items[columnIndex].subtaskController.clear();
    setState(() {});
  }

  void deleteSubtask(int columnIndex, int subtaskIndex) {
    items[columnIndex].subtasks.removeAt(subtaskIndex);
    setState(() {});
  }

  void toggleSubtask(int columnIndex, int subtaskIndex, bool value) {
    items[columnIndex].subtasks[subtaskIndex].isDone = value;
    setState(() {});
  }

  @override
  void dispose() {
    columnName.dispose();

    for (final task in items) {
      task.subtaskController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: const Text('Dynamic Kanban Board'),
        backgroundColor: const Color(0xFF3568B5),
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(onPressed: addColumn, icon: const Icon(Icons.add)),
        ],
      ),
      body: KanbanBody(
        columnName: columnName,
        items: items,
        addSubtask: addSubtask,
        deleteSubtask: deleteSubtask,
        toggleSubtask: toggleSubtask,
      ),
    );
  }
}

class Task {
  String title = "";
  List<Subtask> subtasks = [];
  TextEditingController subtaskController = TextEditingController();
}

class Subtask {
  String title2;
  bool isDone;

  Subtask({required this.title2, this.isDone = false});
}
