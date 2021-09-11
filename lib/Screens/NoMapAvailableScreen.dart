import 'package:flutter/material.dart';

class NoMapAvailable extends StatelessWidget {
  final String title;

  NoMapAvailable(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.grey[750],
      ),
      backgroundColor: Colors.grey[850],
      body: Center(
        child: Text(
          "Opps........................................No Map Available For This Property",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
