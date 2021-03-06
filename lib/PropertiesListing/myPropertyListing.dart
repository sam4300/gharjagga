import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Widgets/myPropertiesListView.dart';

class MyProperties extends StatelessWidget {
  static const routeName = ("/myPropertyList");

  const MyProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text("My Properties"),
        ),
        body: Column(
          children: [
            ListTile(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.blue,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                },
              ),
              title: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.grey[800],
                    border: InputBorder.none,
                    hintText: 'Enter Address, Town or property Id',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                    )),
                style: TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                onPressed: () {},
              ),
            ),
            Expanded(child: MyPropertyListView()),
          ],
        ));
  }
}
