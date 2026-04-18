import 'package:flutter/material.dart';

enum TaskPriority {
  low,
  medium,
  high;

  String get label => switch (this) {
        TaskPriority.low => 'Low',
        TaskPriority.medium => 'Medium',
        TaskPriority.high => 'High',
      };

  Color color(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      TaskPriority.low => scheme.outline,
      TaskPriority.medium => scheme.tertiary,
      TaskPriority.high => scheme.error,
    };
  }

  static TaskPriority fromJson(String value) {
    return TaskPriority.values.firstWhere(
      (e) => e.name == value,
      orElse: () => TaskPriority.medium,
    );
  }
}
