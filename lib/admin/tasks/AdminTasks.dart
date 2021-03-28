import 'AdminTaskInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AdminTaskInfoLoader.dart';


class AdminTasks extends StatelessWidget {

  final info = new UserTaskInfoLoader().loadInfo();

  goBack(BuildContext context){
    Navigator.pushNamed(context, '/adminMenu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blueAccent,
          title: Text('Admin Tasks'),
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
        body: Scrollbar(
            child: ListView(children: <Widget>[
            SingleChildScrollView(
            scrollDirection: Axis.horizontal,
                child: createTable()

                )])));
  }

DataTable createTable() {
  UserTaskInfoLoader infoLoader = new UserTaskInfoLoader();
  var info = infoLoader.loadInfo();
  return DataTable(
    columns: const <DataColumn>[
      DataColumn(
        label: Text(
          'date of creation',
        ),
      ),
      DataColumn(
        label: Text(
          'title',
        ),
      ),
      DataColumn(
        label: Text(
          'user',
        ),
      ),
      DataColumn(
        label: Text(
          'status',
        ),
      ),
      DataColumn(
        label: Text(
          'comments',
        ),
      ),
    ],
    rows: <DataRow>[
      for(int i = 0; i < info.length; i++) DataRow(
        cells: <DataCell>[
          DataCell(Text(DateFormat('yyyy-MM-dd').format(info[i].date))),
          DataCell(Text(info[i].title)),
          DataCell(UsersDropDownButton(info, i, info[i].taskId)),
          DataCell(Text(info[i].status.toString())),
          DataCell(Text(info[i].comments)),
        ],
      ),
    ],
  );
}
}

class UsersDropDownButton extends StatefulWidget {
  final List<AdminTaskInfo> userInfo;
  final int userIndex;
  final int taskId;
  UsersDropDownButton (this.userInfo, this.userIndex, this.taskId);

  @override
  _UsersDropDownButtonState createState() => _UsersDropDownButtonState(userInfo[userIndex].email);
}

class _UsersDropDownButtonState extends State<UsersDropDownButton> {
  String dropdownValue;

  _UsersDropDownButtonState(this.dropdownValue);

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
          if(!(dropdownValue == newValue)){
            // TODO change assigned user in db
          }
          dropdownValue = newValue;
        });
      },
      items: widget.userInfo.map((e) => e.email).toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
