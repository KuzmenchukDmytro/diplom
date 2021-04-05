import 'UserInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserSevice {
  Future<List<UserInfo>> loadInfo() async{
    var usersResponse = await http.get(
        Uri.parse('https://dataset.yourcofounder.com.ua/users/'),
    );
    Iterable usersJson = json.decode(usersResponse.body);
    return List<UserInfo>.from(usersJson.map((i) => UserInfo.fromJson(i)));
  }

  Future<Set<String>> loadUsers() async{
    var usersResponse = await http.get(
        Uri.parse('https://dataset.yourcofounder.com.ua/users/'),
    );
    Iterable usersJson = json.decode(usersResponse.body);
    return Set<String>.from(usersJson.map((e) => e['email']).toList());
  }

  Future<int> getUserId(String email) async {
    var usersResponse = await http.get(
        Uri.parse('https://dataset.yourcofounder.com.ua/users/'),
    );
    Iterable usersJson = json.decode(usersResponse.body);
    return usersJson.firstWhere((element) => element['email'] == email)['id'];
  }

  void deleteUserById(int id){
    http.delete(
        Uri.parse('https://dataset.yourcofounder.com.ua/users/$id/'),
    );
  }

  void demotePrivilegesByUserId(int id){
    final String uri = 'https://dataset.yourcofounder.com.ua/users/$id/';
    final body = {
      'is_staff': false.toString()
    };
    http.patch(Uri.parse(uri), body: body);
  }

  void elevatePrivilegesByUserId(int id){
    final String uri = 'https://dataset.yourcofounder.com.ua/users/$id/';
    final body = {
      'is_staff': true.toString()
    };
    http.patch(Uri.parse(uri), body: body);
  }


}