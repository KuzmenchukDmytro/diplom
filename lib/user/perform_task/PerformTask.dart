import 'package:diplom/user/tasks/UserTaskService.dart';
import 'package:flutter/material.dart';

import 'file:///D:/study/8%20semester/diplom/lib/user/perform_task/ImageInfo.dart';

class PerformTaskArguments {
  int taskId;

  PerformTaskArguments(this.taskId);
}

class PerformTask extends StatefulWidget {
  @override
  _PerformTaskState createState() => _PerformTaskState();
}

class _PerformTaskState extends State<PerformTask> {
  List<String> images = new List();
  bool load = false;
  Image image;

  goBack(BuildContext context) {
    Navigator.pushNamed(context, '/userTasks');
  }

  @override
  Widget build(BuildContext context) {
    if (!load) {
      loadState(context);
      load = true;
    }
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Perform task'),
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
          children: [
            image,
          ],
        ));
  }

  void loadState(BuildContext context) async {
    PerformTaskArguments task =
        ModalRoute.of(context).settings.arguments as PerformTaskArguments;
    List<ImageInf> images =
        await new UserTaskService().loadTaskImages(task.taskId);
    setState(() {
      image = Image.network(images[0].url);
    });
  }
}
