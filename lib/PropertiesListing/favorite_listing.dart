import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Widgets/favorite_Listview.dart';

class FavoriteLists extends StatefulWidget {
  const FavoriteLists({Key? key}) : super(key: key);

  @override
  _FavoriteListsState createState() => _FavoriteListsState();
}

class _FavoriteListsState extends State<FavoriteLists> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
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
                onChanged:(value){
                  searchText =value;
                },
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
                onPressed: () {
                  setState(() {});
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            Expanded(child: FavoriteListView(searchText: searchText,)),
          ],
        ));
  }
}
