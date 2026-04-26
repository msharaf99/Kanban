# 🧩 Flutter Kanban Board

A simple and clean Kanban board built using Flutter.
This project demonstrates how to build a dynamic task management UI using reusable widgets and state management.

---

## 🚀 Features

* Create dynamic columns
* Add subtasks inside each column
* Mark subtasks as completed
* Delete subtasks with swipe (Slidable)
* Clean and modern UI
* Reusable widget-based architecture

---

## 🏗️ Project Structure

```
lib/
  kanban.dart              # Main page (state & logic)
  widgets/
    kanban_body.dart       # Main layout UI
    column_widget.dart     # Column UI
    subtask_input.dart     # Input field for tasks
    subtask_item.dart      # Single task UI
```

---

## 💡 Concepts Used

* Stateful & Stateless Widgets
* ListView.builder (dynamic lists)
* Custom reusable widgets
* TextEditingController
* Callback functions between widgets
* UI separation (logic vs design)

---

## 🎯 Why this project?

This project was built to practice:

* UI design in Flutter
* Breaking large UI into smaller widgets
* Managing dynamic data (tasks & subtasks)
* Preparing for real-world Flutter development

---

## 🛠️ How to Run

1. Make sure Flutter is installed
2. Run:

```
flutter pub get
flutter run
```

---

## 📌 Future Improvements

* Drag & drop between columns
* Save data locally (SQLite / Hive)
* Add task priorities (High / Medium / Low)
* User authentication

