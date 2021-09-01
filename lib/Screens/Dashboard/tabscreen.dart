import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/TabScreens/addProduct.dart';
import 'package:ghaarjaggaa/Screens/TabScreens/my_Profile.dart';
import 'package:ghaarjaggaa/Screens/TabScreens/notificationScreen.dart';
import 'package:provider/provider.dart';

import 'dashboard.dart';
import '../TabScreens/favoriteScreen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = "/tab_screen";
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  List<Widget> _pages = [
    Dashboard(),
    Favorites(),
    AddProduct(),
    NotificationScreen(),
    MyProfile(),
  ];
  bool isEditing = false;
  int _selectPageIndex = 0;

  void _selectPage(int index) {
    if (isEditing) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('AlertDialog Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('This is a demo alert dialog.'),
                  Text('Would you like to approve of this message?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Approve'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        _selectPageIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _selectPage,
        backgroundColor: Colors.grey[850],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _selectPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Profile",
          ),
        ],
      ),
      body: _pages[_selectPageIndex],
    );
  }

}
