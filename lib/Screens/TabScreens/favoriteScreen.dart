import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Components/drawer.dart';
import 'package:ghaarjaggaa/PropertiesListing/favorite_listing.dart';
import 'package:ghaarjaggaa/Widgets/favorite_Listview.dart';

class Favorites extends StatelessWidget {
  static const routeName = "/favorites";

  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("My Favorites"),
      ),
      body: Container(),
    );
  }
}
