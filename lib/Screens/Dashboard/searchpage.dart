import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  static const routeName = '/search-page.dart';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text('GharJagga'),
          centerTitle: true,
          backgroundColor: Colors.grey[850],
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                width: 400,
                child: SafeArea(
                  child: TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[800],
                        border: InputBorder.none,
                        prefixIcon: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        hintText: 'Enter Address, Town or property Id',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 15,
                        )),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
