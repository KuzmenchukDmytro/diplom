import 'package:diplom/user/tasks/UserTasks.dart';

import 'admin/create_task/CreateTask.dart';
import 'admin/menu_for_admins/AdminMenu.dart';
import 'admin/user_management/UserManagement.dart';
import 'file:///D:/study/8%20semester/diplom/lib/admin/tasks/AdminTasks.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/adminMenu',
      routes: {
        '/adminMenu': (context) => AdminMenu(),
        '/adminTasks': (context) => AdminTasks(),
        '/userManagement': (context) => UserManagement(),
        '/createTask': (context) => CreateTask(),
        '/userTasks': (context) => UserTasks(),
      },
    );
  }
}
