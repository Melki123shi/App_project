// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/drawer_bloc.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {

  @override
  Widget build(BuildContext context) {
    final DrawerBloc _drawerBloc = BlocProvider.of<DrawerBloc>(context);

    return Drawer(
      backgroundColor:Color.fromARGB(255, 37, 37, 37),

      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Marathon Motors"),
            accountEmail: Text('"Be the reason someone buys today!"'),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain, image: AssetImage("images/car1.jpg")),
            ),
          ),
          ListTile(
            
            leading: Icon(Icons.person, color: Colors.white),
            title: Text("Hiwot Beyene",style: TextStyle(color: Colors.white)),
            subtitle: Text("Employee",style: TextStyle(color: Colors.white),),
            onTap: () {},
          ),
          ListTile(
              leading: Icon(Icons.people, color: Colors.white),
              title: Text("Other Employees", style: TextStyle(color: Colors.white)),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text("Settings",style: TextStyle(color: Colors.white)),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.logout, color: Colors.white), title: Text("Logout", style: TextStyle(color: Colors.white)), onTap: () {}),
        ],
      ),
    );
  }
}
