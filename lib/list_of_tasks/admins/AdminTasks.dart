import 'package:flutter/material.dart';

class AdminTasks extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Admin Tasks'),
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
    );
  }

}