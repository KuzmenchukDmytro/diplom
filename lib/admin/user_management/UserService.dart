import 'UserInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserSevice {
  Future<List<UserInfo>> loadInfo() async{
    var usersResponse = await http.get(
      'http://35.222.44.102:8000/users/',
    );
    Iterable usersJson = json.decode(usersResponse.body);
    return List<UserInfo>.from(usersJson.map((i) => UserInfo.fromJson(i)));
  }

  Future<Set<String>> loadUsers() async{
    var usersResponse = await http.get(
      'http://35.222.44.102:8000/users/',
    );
    Iterable usersJson = json.decode(usersResponse.body);
    return Set<String>.from(usersJson.map((e) => e['email']).toList());
  }

  Future<int> getUserId(String email) async {
    var usersResponse = await http.get(
      'http://35.222.44.102:8000/users/',
    );
    Iterable usersJson = json.decode(usersResponse.body);
    return usersJson.firstWhere((element) => element['email'] == email)['id'];
  }

  void deleteUserById(int id){
    http.delete(
      'http://35.222.44.102:8000/users/$id/',
    );
  }
}