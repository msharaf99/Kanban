import 'kanban_column.dart';
import 'task_priority.dart';

class Task {
  Task({
    required this.id,
    required this.title,
    this.description = '',
    required this.column,
    this.priority = TaskPriority.medium,
    required this.createdAt,
    required this.updatedAt,
    this.sortOrder = 0,
  });

  final String id;
  String title;
  String description;
  KanbanColumn column;
  TaskPriority priority;
  DateTime createdAt;
  DateTime updatedAt;
  int sortOrder;

  /// Snapshot for undo / optimistic updates.
  Task clone() => Task(
        id: id,
        title: title,
        description: description,
        column: column,
        priority: priority,
        createdAt: createdAt,
        updatedAt: updatedAt,
        sortOrder: sortOrder,
      );

  Task copyWith({
    String? title,
    String? description,
    KanbanColumn? column,
    TaskPriority? priority,
    DateTime? updatedAt,
    int? sortOrder,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      column: column ?? this.column,
      priority: priority ?? this.priority,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'column': column.name,
        'priority': priority.name,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'sortOrder': sortOrder,
      };

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      column: KanbanColumn.fromJson(json['column'] as String),
      priority: TaskPriority.fromJson(json['priority'] as String? ?? 'medium'),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      sortOrder: json['sortOrder'] as int? ?? 0,
    );
  }
}
