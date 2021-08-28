import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  static const  routeName = "/my_profile";
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
         title: Text("My Profile"),
      ),
      body: Container(
         color: Colors.black,
      ),
    );
  }
}
