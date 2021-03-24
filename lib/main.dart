import 'package:diplom/list_of_tasks/admins/AdminTasks.dart';
import 'package:diplom/menu_for_admins/AdminMenu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AdminMenu(),
      home: AdminTasks(),
    );
  }
}
