import 'package:diplom/user_management/UserInfoLoader.dart';
import 'package:flutter/material.dart';

import 'UserInfo.dart';

class UserManagement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('User Management'),
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

              )]))
    );
  }

  DataTable createTable(){
    UserInfoLoader userInfoLoader = new UserInfoLoader();
    List<UserInfo> userInfo = userInfoLoader.loadInfo();

    return DataTable(
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
          for(int i = 0; i < userInfo.length; i++) DataRow(
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
                  // TODO delete user with id userInfo[i].id
                  print(userInfo[i].id)
                },
              )),
            ],
          ),
        ],
    );
  }
}

class RolesDropDownButton extends StatefulWidget {
  final UserRole userRole;
  final int userId;
  RolesDropDownButton (this.userRole, this.userId);

  @override
  _RolesDropDownButtonState createState() => _RolesDropDownButtonState(userRole.toString());
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
          if(!(dropdownValue == newValue)){
            if(newValue == UserRole.user.toString()){
              // TODO change role user with id widget.userId to USER
              print('to user');
            }
            else{
              print('to admin');
              // TODO change role user with id widget.userId to ADMIN
            }
          }
          dropdownValue = newValue;
        });
      },
      items: UserRole.values.map((e) => e.toString()).toList()
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}