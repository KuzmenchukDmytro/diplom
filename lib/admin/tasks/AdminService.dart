import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'AdminTaskInfo.dart';

class UserTaskInfoLoader{

  Future<List<AdminTaskInfo>> loadInfo() async {
    final response = await http.get(
      'http://35.222.44.102:8000/tasks/',
    );
    final usersResponse = await http.get(
      'http://35.222.44.102:8000/users/',
    );
    if(response.statusCode == 200){
      Iterable tasks = json.decode(response.body);
      Iterable users = json.decode(usersResponse.body);
      print(tasks);
      return List<AdminTaskInfo>.from(tasks.map((i) => AdminTaskInfo.fromJson(i, users)));
    }
    else{
      throw new Exception(json.decode(response.body)['error']);
    }
  }


}