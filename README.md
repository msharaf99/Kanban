# 🧩 Kanban Board (Flutter)

A simple Kanban-style task manager built with Flutter.
You can create columns and manage subtasks inside each column.

---

## ✨ Features

* Add dynamic columns
* Add / complete / delete subtasks
* Swipe to delete (Slidable)
* Clean UI using reusable widgets

---

## 🛠 Tech Stack

* Flutter (UI)
* Dart (language)
* flutter_slidable (gesture actions)

---

## 📁 Structure

```bash
lib/
  kanban.dart
  widgets/
    kanban_body.dart
    column_widget.dart
    subtask_input.dart
    subtask_item.dart
```

---

## ▶️ Run

```bash
flutter pub get
flutter run
```

---

## 📌 Notes

* State is managed using `setState`
* UI is split into small reusable widgets
* Data is stored in memory (no database yet)
