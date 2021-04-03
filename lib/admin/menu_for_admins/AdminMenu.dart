import 'package:flutter/material.dart';

class AdminMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Admin Menu'),
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

                Navigator.pushNamed(context, '/adminTasks');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1, color: Colors.grey[400]),
                )),
                height: 50,
                child: const Center(
                    child: Text(
                  'Tasks Info',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/createTask');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1, color: Colors.grey[400]),
                )),
                height: 50,
                child: const Center(
                    child: Text(
                  'Create Task',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO go to user management page
                Navigator.pushNamed(context, '/userManagement');
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 1, color: Colors.grey[400]),
                        bottom: BorderSide(width: 1, color: Colors.grey[400]))),
                height: 50,
                child: const Center(
                    child: Text(
                  'User Management',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ),
            ),
          ],
        ));
  }
}
