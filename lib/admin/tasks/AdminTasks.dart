import 'package:diplom/admin/create_task/TaskService.dart';
import 'package:diplom/admin/user_management/UserService.dart';

import 'AdminTaskInfo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'AdminService.dart';


class AdminTasks extends StatefulWidget {
  bool load = false;

  @override
  _AdminTasksState createState() => _AdminTasksState();
}

class _AdminTasksState extends State<AdminTasks> {
  Widget dataTable = Container();

  goBack(BuildContext context) {
    Navigator.pushNamed(context, '/adminMenu');
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    if (!widget.load) {
      createTable();
      widget.load = true;
    }
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
              scrollDirection: Axis.horizontal, child: dataTable)
        ])));
  }

  void createTable() async {
    UserTaskInfoLoader infoLoader = new UserTaskInfoLoader();

    var users = await new UserSevice().loadUsers();

    Widget resDataTable;
    await infoLoader.loadInfo().then((info) {
      resDataTable = DataTable(
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
          for (int i = 0; i < info.length; i++)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(DateFormat('yyyy-MM-dd').format(info[i].date))),
                DataCell(Text(info[i].title)),
                DataCell(UsersDropDownButton(info, users, i, info[i].taskId)),
                DataCell(Text(info[i].status.toString())),
                DataCell(Text(info[i].comments)),
              ],
            ),
        ],
      );
    });
    setState(() {
      dataTable = resDataTable;
    });
  }
}

class UsersDropDownButton extends StatefulWidget {
  final List<AdminTaskInfo> userInfo;
  final Set<String> users;
  final int userIndex;
  final int taskId;

  UsersDropDownButton(this.userInfo, this.users, this.userIndex, this.taskId);

  @override
  _UsersDropDownButtonState createState() =>
      _UsersDropDownButtonState(userInfo[userIndex].email);
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
        if (dropdownValue != newValue) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(""),
                content: Text(
                    "Do you really want to change assigned user for task ${widget.userInfo[widget.userIndex].title} "
                    "from ${widget.userInfo[widget.userIndex].email} to $newValue ?"),
                actions: [
                  FlatButton(
                    child: Text(
                      "   no   ",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  FlatButton(
                    child: Text(
                      "   yes   ",
                      style: TextStyle(fontSize: 18, color: Colors.green),
                    ),
                    onPressed: () {
                      // TODO change assigned user in db
                      new TaskService().changeAssignedUser(widget.userInfo[widget.userIndex].taskId,
                          newValue);
                      setState(() {
                        dropdownValue = newValue;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      items: widget.users
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
