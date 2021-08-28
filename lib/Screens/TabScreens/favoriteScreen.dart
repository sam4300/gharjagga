import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  static const routeName = "/favorites";
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("My Favorites"),
      ),
      body: Container(
        color: Colors.grey[850],
      ),
    );
  }
}
