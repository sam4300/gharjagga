import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Widgets/nearByPropertiesListView.dart';
import 'package:ghaarjaggaa/Widgets/apartments_listview.dart';

class NearByPropertiesListing extends StatefulWidget {
  static const routeName = ("/narByPropertiesList");

  final double currentUserLatitude;
  final double currentUserLongitude;

  NearByPropertiesListing(
      {required this.currentUserLongitude, required this.currentUserLatitude});

  @override
  _NearByPropertiesListingState createState() =>
      _NearByPropertiesListingState();
}

class _NearByPropertiesListingState extends State<NearByPropertiesListing> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text("Nearby Properties"),
        ),
        body: NearByProperties(
          currentUserLongitude: widget.currentUserLatitude,
          currentUserLatitude: widget.currentUserLongitude,
        ));
  }
}
