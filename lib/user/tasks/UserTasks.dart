import 'package:diplom/user/perform_task/PerformTask.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'UserTaskService.dart';

class UserTasks extends StatefulWidget {
  @override
  _UserTasksState createState() => _UserTasksState();
}

class _UserTasksState extends State<UserTasks> {
  Widget dataTable = Container();
  bool load = false;

  @override
  Widget build(BuildContext context) {
    if (!load) {
      createTable();
      load = true;
    }
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('My Tasks'),
          titleSpacing: 23,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 25,
              padding: EdgeInsets.only(right: 25),
              onPressed: () {},
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
    UserTaskService infoLoader = new UserTaskService();
    var info = await infoLoader.loadInfo();
    DataTable result = DataTable(
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
            'comments',
          ),
        ),
      ],
      rows: <DataRow>[
        for (int i = 0; i < info.length; i++)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(DateFormat('yyyy-MM-dd').format(info[i].date)),
                  onTap: () => {Navigator.pushNamed(context, '/performTasks', arguments: PerformTaskArguments(info[i].taskId))}),
              DataCell(Text(info[i].title),
                  onTap: () => {Navigator.pushNamed(context, '/performTasks', arguments: PerformTaskArguments(info[i].taskId))}),
              DataCell(Text(info[i].comments),
                  onTap: () => {Navigator.pushNamed(context, '/performTasks', arguments: PerformTaskArguments(info[i].taskId))}),
            ],
          ),
      ],
    );
    setState(() {
      dataTable = result;
    });
  }
}
