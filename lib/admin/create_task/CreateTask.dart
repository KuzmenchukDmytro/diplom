import 'package:diplom/admin/user_management/UserService.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'TaskService.dart';

class CreateTask extends StatefulWidget {
  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final titleTextController = TextEditingController();
  final commentsTextController = TextEditingController();
  String dropdownValue;
  List<DropdownMenuItem<String>> items;
  List<Asset> images = List();

  bool isSet = false;

  goBack(BuildContext context) {
    Navigator.pushNamed(context, '/adminMenu');
  }

  @override
  Widget build(BuildContext context) {
    if(!isSet){
      createUsersButton(context);
      isSet = true;
    }
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
              margin: EdgeInsets.only(left: 80, right: 20),
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
              height: 45,
              margin: EdgeInsets.only(left: 80, right: 20, top: 10),
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
              margin: EdgeInsets.only(left: 80, right: 20),
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
                    items: items,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 80, right: 20),
              child: Row(
                children: [
                  Text(
                    ' Upload images',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.upload_file),
                      iconSize: 30,
                      color: Colors.green[300],
                      onPressed: () => {loadAssets()}),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(width: 2.5, color: Colors.green[400])),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(15),
                  )),
                  // shape:
                ),
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(""),
                        content: Text("Do you want to create another task?"),
                        actions: [
                          FlatButton(
                            child: Text(
                              "   no   ",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, '/adminMenu');
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "   yes   ",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.green),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, '/createTask');
                            },
                          ),
                        ],
                      );
                    },
                  ),
                },
                child: Container(
                  height: 45,
                  width: 150,
                  alignment: Alignment.center,
                  child: Text(
                    'Create task',
                    style: TextStyle(fontSize: 19, color: Colors.green[400]
                        // color: Colors.green[300]
                        ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void saveTask() async {
    TaskService taskService = new TaskService();
    // taskService.createTask(titleTextController.text, commentsTextController.text, dropdownValue, images);
  }

  void createUsersButton(BuildContext context) async {
    var users = await new UserSevice().loadUsers();
    setState(() {
      dropdownValue = users.first;
      items = users
          .map<DropdownMenuItem<String>>((String value){
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList();
    });
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }
}
