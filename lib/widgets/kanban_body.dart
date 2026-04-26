import 'package:flutter/material.dart';
import 'column_widget.dart';

class KanbanBody extends StatelessWidget {
  const KanbanBody({
    super.key,
    required this.columnName,
    required this.items,
    required this.addSubtask,
    required this.deleteSubtask,
    required this.toggleSubtask,
  });

  final TextEditingController columnName;
  final List items;
  final void Function(int columnIndex) addSubtask;
  final void Function(int columnIndex, int subtaskIndex) deleteSubtask;
  final void Function(int columnIndex, int subtaskIndex, bool value)
  toggleSubtask;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: columnName,
              decoration: const InputDecoration(
                hintText: 'Enter column name...',
                border: InputBorder.none,
                prefixIcon: Icon(Icons.dashboard_customize_outlined),
              ),
            ),
          ),

          Expanded(
            child: items.isEmpty
                ? const Center(
                    child: Text(
                      'No columns yet. Add your first column!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return KanbanColumn(
                        title: items[index].title,
                        subtaskController: items[index].subtaskController,
                        subtasks: items[index].subtasks,
                        onAddSubtask: () => addSubtask(index),
                        onDeleteSubtask: (subtaskIndex) {
                          deleteSubtask(index, subtaskIndex);
                        },
                        onToggleSubtask: (subtaskIndex, value) {
                          toggleSubtask(index, subtaskIndex, value);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
