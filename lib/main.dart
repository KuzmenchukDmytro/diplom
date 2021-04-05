import 'package:diplom/user/perform_task/PerformTask.dart';
import 'package:diplom/user/tasks/UserTasks.dart';

import 'CommonMenu/CommonMenu.dart';
import 'admin/create_task/CreateTask.dart';
import 'admin/menu_for_admins/AdminMenu.dart';
import 'admin/tasks/AdminTasks.dart';
import 'admin/user_management/UserManagement.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/commonMenu',
      routes: {
        '/adminMenu': (context) => AdminMenu(),
        '/adminTasks': (context) => AdminTasks(),
        '/userManagement': (context) => UserManagement(),
        '/createTask': (context) => CreateTask(),
        '/userTasks': (context) => UserTasks(),
        '/performTasks': (context) => PerformTask(),
        '/commonMenu': (context) => CommonMenu(),
      },
    );
  }
}
