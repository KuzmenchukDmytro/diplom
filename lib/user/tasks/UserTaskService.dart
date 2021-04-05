import 'file:///D:/study/8%20semester/diplom/lib/user/perform_task/ImageInfo.dart';

import 'UserTaskInfo.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class UserTaskService{
  Future<List<UserTaskInfo>> loadInfo() async{
    final response = await http.get(
      'http://35.222.44.102:8000/tasks/',
    );
    if(response.statusCode == 200){
      Iterable tasks = json.decode(response.body);
      return List<UserTaskInfo>.from(tasks.map((i) => UserTaskInfo.fromJson(i)));
    }
    else{
      throw new Exception(json.decode(response.body)['error']);
    }
  }

  Future<List<ImageInf>> loadTaskImages(int id) async{
    final response = await http.get(
      'http://35.222.44.102:8000/tasks/$id/',
    );
    // json.decode(response.body)['images'][0]['file']
    List<dynamic> images = json.decode(response.body)['images'] as List<dynamic>;
    List<ImageInf> result = images.map((element) => ImageInf(element['file'].toString(), int.parse(element['id'].toString()))).toList();
    return result;
  }
}