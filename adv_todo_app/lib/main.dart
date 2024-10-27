import 'package:flutter/material.dart';
import 'todo_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Adv_ToDo_App()
    );
  }
}
