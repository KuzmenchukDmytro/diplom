import 'package:diplom/admin/user_management/UserService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class TaskService {
  createTask(title, comment, email, images){

  }

  void changeAssignedUser(int taskId, String email) async{
    int userId = await new UserSevice().getUserId(email);
    final String uri = 'http://35.222.44.102:8000/tasks/$taskId/';
    final body = {
      'user': userId.toString()
    };
    var taskResponse = await http.patch(uri, body: body);
  }
}