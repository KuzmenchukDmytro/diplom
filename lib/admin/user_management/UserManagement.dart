import 'package:flutter/material.dart';

import 'UserInfo.dart';
import 'UserService.dart';

class UserManagement extends StatefulWidget {
  @override
  _UserManagementState createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  Widget dataTable = Container();
  bool load = false;

  goBack(BuildContext context) {
    Navigator.pushNamed(context, '/adminMenu');
  }

  @override
  Widget build(BuildContext context) {
    if (!load) {
      createTable(context);
      load = true;
    }
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.blueAccent,
            title: Text('User Management'),
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
          ]))),
    );
  }

  void createTable(BuildContext context) async{
    UserSevice userInfoLoader = new UserSevice();
    List<UserInfo> userInfo = await userInfoLoader.loadInfo();

    DataTable result =  DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'name',
          ),
        ),
        DataColumn(
          label: Text(
            'lastname',
          ),
        ),
        DataColumn(
          label: Text(
            'email',
          ),
        ),
        DataColumn(
          label: Text(
            'role',
          ),
        ),
        DataColumn(
          label: Text(
            'action',
          ),
        ),
      ],
      rows: <DataRow>[
        for (int i = 0; i < userInfo.length; i++)
          DataRow(
            cells: <DataCell>[
              DataCell(Text(userInfo[i].name)),
              DataCell(Text(userInfo[i].lastname)),
              DataCell(Text(userInfo[i].email)),
              DataCell(RolesDropDownButton(userInfo[i].role, userInfo[i].id)),
              DataCell(IconButton(
                icon: Icon(Icons.close),
                iconSize: 25,
                color: Colors.red,
                onPressed: () => {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(""),
                        content: Text(
                            "Do you really want to delete user: ${userInfo[i].email} ?"),
                        actions: [
                          FlatButton(
                            child: Text(
                              "cancel",
                              style: TextStyle(fontSize: 18,
                                  color: Colors.red),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text(
                              "confirm",
                              style: TextStyle(fontSize: 18,
                                  color: Colors.green),
                            ),
                            onPressed: () {
                              new UserSevice().deleteUserById(userInfo[i].id);
                              Navigator.of(context).pop();
                              Navigator.pop(context);
                              Navigator.pushNamed(context, "/userManagement");
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  print(userInfo[i].id)
                },
              )),
            ],
          ),
      ],
    );
    setState(() {
      dataTable = result;
    });
  }
}

class RolesDropDownButton extends StatefulWidget {
  final UserRole userRole;
  final int userId;

  RolesDropDownButton(this.userRole, this.userId);

  @override
  _RolesDropDownButtonState createState() =>
      _RolesDropDownButtonState(userRole.toString());
}

class _RolesDropDownButtonState extends State<RolesDropDownButton> {
  String dropdownValue;

  _RolesDropDownButtonState(this.dropdownValue);

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
          if (!(dropdownValue == newValue)) {
            if (newValue == UserRole.user.toString()) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(""),
                    content: Text(
                        "Do you really want to demote privileges to USER?"),
                    actions: [
                      FlatButton(
                        child: Text(
                          "cancel",
                          style: TextStyle(fontSize: 18,
                              color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text(
                          "confirm",
                          style: TextStyle(fontSize: 18,
                              color: Colors.green),
                        ),
                        onPressed: () {
                          // TODO change role user with id widget.userId to USER
                          dropdownValue = newValue;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              print('to admin');
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(""),
                    content: Text(
                        "Do you really want to elevate privileges to ADMIN?"),
                    actions: [
                      FlatButton(
                        child: Text(
                          "cancel",
                          style: TextStyle(fontSize: 18,
                              color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text(
                          "confirm",
                          style: TextStyle(fontSize: 18,
                              color: Colors.green),
                        ),
                        onPressed: () {
                          // TODO change role user with id widget.userId to ADMIN
                          dropdownValue = newValue;
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          }
        });
      },
      items: UserRole.values
          .map((e) => e.toString())
          .toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
