import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'AdminTaskInfo.dart';

class UserTaskInfoLoader{
  /*List<AdminTaskInfo> loadInfo(){
    // TODO load tasks info from db
    var result = new List<AdminTaskInfo>();
    result.add(new AdminTaskInfo(1, new DateTime(2021, 1, 1), 'email1', 'name1', 'comment1 123123123213123213213213123', Status.assigned));
    result.add(new AdminTaskInfo(2, new DateTime(2021, 1, 1), 'email2', 'name2', 'comment2 453343512343543512353521343', Status.done));
    result.add(new AdminTaskInfo(3, new DateTime(2021, 1, 1), 'email3', 'name3', 'comment3 sdfdfbfghewdadscsdgtergwefr', Status.assigned));
    result.add(new AdminTaskInfo(4, new DateTime(2021, 1, 1), 'email4', 'name4', 'comment4 cvvbhjuhrteqdwdascdfbfgnyty', Status.done));
    result.add(new AdminTaskInfo(5, new DateTime(2021, 1, 1), 'email5', 'name5', 'comment5 234tfgdfvfbgn56765gdvth45fg', Status.assigned));
    result.add(new AdminTaskInfo(6, new DateTime(2021, 1, 1), 'email6', 'name6', 'comment6 zcxvfnytjsaedfdfhw4terg23fd', Status.done));
    return result;
  }*/

  Future<List<AdminTaskInfo>> loadInfo() async {
    final response = await http.get(
      'http://35.222.44.102:8000/tasks/',
      // headers: {HttpHeaders.authorizationHeader: "bearer 80ad1868-e5a0-42fe-bd8d-b9f7fa03e07f"},
    );
    print(response);
    if(response.statusCode == 200){
      Iterable tasks = json.decode(response.body)['data'];
      return List<AdminTaskInfo>.from(tasks.map((i) => AdminTaskInfo.fromJson(i)));
    }
    else{
      throw new Exception(json.decode(response.body)['error']);
    }
  }

}