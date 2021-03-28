import 'package:diplom/admin/user_management/UserInfo.dart';
import 'package:diplom/admin/user_management/UserInfoLoader.dart';
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

  goBack(BuildContext context) {
    Navigator.pushNamed(context, '/adminMenu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Create Task'),
          titleSpacing: 23,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 25,
              padding: EdgeInsets.only(right: 25),
              onPressed: () {
                goBack(context);
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 45,
              padding: EdgeInsets.only(left: 80, right: 20),
              child: TextField(
                showCursor: true,
                controller: titleTextController,
                decoration: InputDecoration(
                    // labelText: 'task title',
                    hintText: 'Enter task title',
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(15),
                      borderSide: new BorderSide(),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 80, right: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    ' Select user   ',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style:
                        const TextStyle(color: Colors.deepPurple, fontSize: 17),
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
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 80, right: 20, bottom: 10),
              child: Row(
                children: [
                Text(
                ' Upload images',
                style: TextStyle(
                  fontSize: 17,
                ),),
                  IconButton(
                      icon: Icon(Icons.upload_file),
                      iconSize: 30,
                      color: Colors.green[300],
                      onPressed: () => {imgFromGallery()}),
                ],
              ),
            ),
            Container(
              height: 45,
              padding: EdgeInsets.only(left: 80, right: 20),
              child: TextField(
                controller: commentsTextController,
                decoration: InputDecoration(
                    enabledBorder: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(15),
                      borderSide: new BorderSide(),
                    ),
                    // labelText: 'task comments',
                    hintText: 'Add comments'),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(BorderSide(width: 2.5, color: Colors.green[400])),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15),
                    )),
                    // shape:
                  ),
                  onPressed: () => {
                    // TODO create task
                  },
                  child: Container(
                    height: 45,
                    width: 150,
                    alignment: Alignment.center,
                    child: Text(
                      'Create task',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.green[400]
                        // color: Colors.green[300]
                      ),
                    ),
                  ),
              ),
            )
          ],
        ));
  }

  imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      images.add(image);
    });
  }
}
