import 'package:flutter/material.dart';
import 'package:mnews/pages/home.dart';

class CategoriesDrawer extends StatelessWidget {
  TabController controller;

  CategoriesDrawer({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Text(
              'Breaking News ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
        ]..addAll(categories
            .map((e) => ListTile(
                  title: Text(e),
                  onTap: () {
                   controller.animateTo(categories.indexOf(e));
                   Navigator.of(context).pop();
                  },
                ))
            .toList()),
      ),
    );
    ;
  }
}
