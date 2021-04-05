import 'package:diplom/user/tasks/UserTaskService.dart';
import 'package:flutter/material.dart';

import 'ImageInfo.dart';
import 'LabeledImage.dart';


class PerformTaskArguments {
  int taskId;

  PerformTaskArguments(this.taskId);
}

class PerformTask extends StatefulWidget {
  @override
  _PerformTaskState createState() => _PerformTaskState();
}

class _PerformTaskState extends State<PerformTask> {
  List<ImageInf> images = new List();
  bool load = false;
  Widget image = Container();
  int imageIndex = 0;

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
            Emojis(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(icon: Icon(Icons.arrow_back_outlined,
                  size: 35,), onPressed: () => {
                    if(imageIndex > 0 && images.length != 0){
                      setState(() {
                        image = Image.network(images[imageIndex - 1].url, height: 650);
                        imageIndex = imageIndex - 1;
                      })
                    }
                  }),
                ),
                Container(
                  child: IconButton(icon: Icon(Icons.arrow_forward_outlined,
                  size: 35,), onPressed: () => {
                    if(imageIndex < images.length - 1 && images.length != 0){
                      setState(() {
                        image = Image.network(images[imageIndex + 1].url, height: 650);
                        imageIndex = imageIndex + 1;
                      })
                    }
                  }),
                ),
              ],
            )
          ],
        ));
  }

  void loadState(BuildContext context) async {
    PerformTaskArguments task =
        ModalRoute.of(context).settings.arguments as PerformTaskArguments;
    List<ImageInf> resultImages =
        await new UserTaskService().loadTaskImages(task.taskId);
    setState(() {
      image = Image.network(resultImages[0].url, height: 650);
      images = resultImages;
    });
  }
}

class Emojis extends StatefulWidget {
  @override
  _EmojisState createState() => _EmojisState();
}

class _EmojisState extends State<Emojis> {
  String dropdownValue = Emoji.values[0].toString();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
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
      items: Emoji.values.map((e) => e.toString()).toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
