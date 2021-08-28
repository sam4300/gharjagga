import 'package:flutter/material.dart';

class NotificationScreen  extends StatelessWidget {
  static const routeName = "/notificationScreen";
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Notifications"),
      ),
      body: Container(
        color: Colors.black,
      ),
    );
  }
}
