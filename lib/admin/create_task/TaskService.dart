import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'dart:io';

import 'package:diplom/admin/user_management/UserService.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:http/http.dart' as http;
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:path_provider/path_provider.dart';

class TaskService {
  void createTask(title, comment, email,  List<Asset> images) async {
    int currentUser = await new UserSevice().getUserId(email);
    final response = await http.post(
      'http://35.222.44.102:8000/tasks/',
      body: {"name": title, "comments": comment, "user": currentUser},
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      int id = json.decode(response.body)["id"];
      this.createImages(images, id);
    } else {
      throw new Exception(json.decode(response.body)['error']);
    }

    // json.encode(newTeacher.yourMap)
  }

  Future<void> createImages( List<Asset> images, int taskId) async {
    List<File> files = await this.getFileFromAssets(images);
    files.forEach((element) {
      this.sendFiletodjango(element, taskId);
    });
    /*http.post(
      'http://35.222.44.102:8000/images/',
      body: {"task": taskId, "file": images},
    );*/
  }

  /*Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }*/

/*  Future<List<File>> getFileFromAssets(List<Asset> assetArray) async {
    List<File> fileImageArray = [];
    await assetArray.forEach((imageAsset) async {
      final filePath =
          await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);

      File tempFile = File(filePath);
      if (tempFile.existsSync()) {
        fileImageArray.add(tempFile);
      }
    });
    return fileImageArray;
  }*/

  Future<Map<String, dynamic>> sendFiletodjango(File file, int taskId) async {
    var endPoint = 'http://35.222.44.102:8000/images/';
    Map data = {};
    String base64file = base64Encode(file.readAsBytesSync());
    String fileName = file.path.split("/").last;
    data['name'] = fileName;
    data['task'] = taskId;
    data['file'] = base64file;
    try {
      var response = await http.post(endPoint, body: convert.json.encode(data));
    } catch (e) {
      throw (e.toString());
    }
  }

  void changeAssignedUser(int taskId, String email) async {
    int userId = await new UserSevice().getUserId(email);
    final String uri = 'http://35.222.44.102:8000/tasks/$taskId/';
    final body = {'user': userId.toString()};
    http.patch(uri, body: body);
  }

  void deleteTaskById(int id) {
    http.delete(
      'http://35.222.44.102:8000/tasks/$id/',
    );
  }
}
