import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'UserTaskInfoLoader.dart';

class UserTasks extends StatelessWidget {

  final info = new UserTaskInfoLoader().loadInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('My Tasks'),
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
            'comments',
          ),
        ),
      ],
      rows: <DataRow>[
        for(int i = 0; i < info.length; i++) DataRow(
          cells: <DataCell>[
            DataCell(Text(DateFormat('yyyy-MM-dd').format(info[i].date)),
                onTap: () => {
                  // Todo go to perform task info
                }),
            DataCell(Text(info[i].title),
                onTap: () => {
                  // Todo go to perform task info
                }),
            DataCell(Text(info[i].comments),
                onTap: () => {
                  // Todo go to perform task info
                }),
          ],
        ),
      ],
    );
  }
}
