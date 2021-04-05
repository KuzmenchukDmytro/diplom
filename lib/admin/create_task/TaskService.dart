import 'package:diplom/admin/user_management/UserService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'Task.dart';
import 'package:http/http.dart' as http;

class TaskService {
  void createTask(title, comment, email, images, users) async {
    int currentUser =
    users.firstWhere((element) => element['email'] == email)['id'];
    final response = await http.patch(
      'http://35.222.44.102:8000/tasks/',
      body: {"name": title, "comments": comment, "user": currentUser},
      headers: {"Content-Type": "application/json"},
    );
    // json.encode(newTeacher.yourMap)

  }

  void changeAssignedUser(int taskId, String email) async{
    int userId = await new UserSevice().getUserId(email);
    final String uri = 'http://35.222.44.102:8000/tasks/$taskId/';
    final body = {
      'user': userId.toString()
    };
    http.patch(uri, body: body);
  }

  void deleteTaskById(int id){
    http.delete(
      'http://35.222.44.102:8000/tasks/$id/',
    );
  }
}
