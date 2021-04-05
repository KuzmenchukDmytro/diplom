import 'package:flutter/material.dart';

class CommonMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Common Menu'),
          leading: IconButton(
            icon: Icon(Icons.logout),
            iconSize: 25,
            padding: EdgeInsets.only(left: 15),
            onPressed: () {
              // TODO logout
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              iconSize: 25,
              padding: EdgeInsets.only(right: 25),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/adminMenu');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1, color: Colors.grey[400]),
                )),
                height: 50,
                child: const Center(
                    child: Text(
                  'Admin Menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/userTasks');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[400]),
                        bottom: BorderSide(width: 1, color: Colors.grey[400]))),
                height: 50,
                child: const Center(
                    child: Text(
                  'User Tasks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ],
        ));
  }
}
