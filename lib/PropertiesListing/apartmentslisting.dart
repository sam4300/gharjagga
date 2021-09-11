import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Widgets/apartments_listview.dart';

class ApartmentsList extends StatefulWidget {
  static const routeName = ("/apartmentsList");

  const ApartmentsList({Key? key}) : super(key: key);

  @override
  _ApartmentsListState createState() => _ApartmentsListState();
}

class _ApartmentsListState extends State<ApartmentsList> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text("Apartments"),
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
                onChanged: (value) {
                  searchText = value;
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
                  print(searchText);
                  setState(() {});
                  FocusScope.of(context).unfocus();
                },
              ),
            ),
            Expanded(child: ApartmentsListView(searchText)),
          ],
        ));
  }
}
