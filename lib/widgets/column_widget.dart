import 'package:flutter/material.dart';
import 'subtask_input.dart';
import 'subtask_item.dart';

class KanbanColumn extends StatelessWidget {
  const KanbanColumn({
    super.key,
    required this.title,
    required this.subtaskController,
    required this.subtasks,
    required this.onAddSubtask,
    required this.onDeleteSubtask,
    required this.onToggleSubtask,
  });

  final String title;
  final TextEditingController subtaskController;
  final List subtasks;
  final VoidCallback onAddSubtask;
  final void Function(int index) onDeleteSubtask;
  final void Function(int index, bool value) onToggleSubtask;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 53, 104, 181),
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Row(
              children: [
                const Icon(Icons.view_column, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${subtasks.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          AddSubtaskInput(controller: subtaskController, onAdd: onAddSubtask),

          Expanded(
            child: subtasks.isEmpty
                ? const Center(
                    child: Text(
                      'No subtasks yet',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 8),
                    itemCount: subtasks.length,
                    itemBuilder: (context, index) {
                      final subtask = subtasks[index];

                      return SubtaskItem(
                        title: subtask.title2,
                        isDone: subtask.isDone,
                        onChanged: (value) {
                          onToggleSubtask(index, value ?? false);
                        },
                        onDelete: () {
                          onDeleteSubtask(index);
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
