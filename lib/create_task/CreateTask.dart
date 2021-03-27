import 'dart:io';

import 'package:diplom/user_management/UserInfo.dart';
import 'package:diplom/user_management/UserInfoLoader.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final titleTextController = TextEditingController();
  final commentsTextController = TextEditingController();
  final List<UserInfo> userInfo = UserInfoLoader().loadInfo();
  String dropdownValue = UserInfoLoader().loadInfo()[0].email;
  List<PickedFile> images = List();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Create Task'),
          titleSpacing: 40,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 25,
              padding: EdgeInsets.only(right: 25),
              onPressed: () {
                // TODO go to previous page
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleTextController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 120),
                  border: InputBorder.none,
                  hintText: 'Enter task title'),
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: userInfo
                  .map((e) => e.email)
                  .toList()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            IconButton(
                icon: Icon(Icons.image),
                iconSize: 30,
                color: Colors.green[400],
                onPressed: () => {
                  imgFromGallery()
                }),
            TextField(
              controller: commentsTextController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 120),
                  border: InputBorder.none,
                  hintText: 'Add comments'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create task',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.add),
                    iconSize: 30,
                    color: Colors.green[400],
                    onPressed: () => {
                          print(titleTextController.text),
                          print(commentsTextController.text),
                          print(dropdownValue)
                          // TODO create task
                        }),
              ],
            ),
          ],
        ));
  }


  imgFromGallery() async {
    PickedFile image = await ImagePicker().getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      images.add(image);
    });
  }
}
