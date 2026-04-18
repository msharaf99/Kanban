import 'package:flutter/material.dart';

enum KanbanColumn {
  backlog,
  todo,
  inProgress,
  done;

  String get label => switch (this) {
        KanbanColumn.backlog => 'Backlog',
        KanbanColumn.todo => 'To Do',
        KanbanColumn.inProgress => 'In Progress',
        KanbanColumn.done => 'Done',
      };

  IconData get icon => switch (this) {
        KanbanColumn.backlog => Icons.inbox_outlined,
        KanbanColumn.todo => Icons.circle_outlined,
        KanbanColumn.inProgress => Icons.pending_actions_outlined,
        KanbanColumn.done => Icons.check_circle_outline,
      };

  /// Accent used for column header and border.
  Color accent(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      KanbanColumn.backlog => scheme.tertiary,
      KanbanColumn.todo => scheme.primary,
      KanbanColumn.inProgress => scheme.secondary,
      KanbanColumn.done => scheme.primaryContainer,
    };
  }

  Color surfaceTint(BuildContext context) {
    return accent(context).withValues(alpha: 0.08);
  }

  static KanbanColumn fromJson(String value) {
    return KanbanColumn.values.firstWhere(
      (e) => e.name == value,
      orElse: () => KanbanColumn.backlog,
    );
  }
}
