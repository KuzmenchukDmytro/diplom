import 'package:diplom/create_task/CreateTask.dart';
import 'package:diplom/list_of_tasks/admins/AdminTasks.dart';
import 'package:diplom/menu_for_admins/AdminMenu.dart';
import 'package:diplom/user_management/UserManagement.dart';
import 'package:flutter/material.dart';

import 'list_of_tasks/users/UserTasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: AdminMenu(),
      // home: AdminTasks(),
      // home: UserTasks(),
      // home: UserManagement(),
      home: CreateTask(),
    );
  }
}
