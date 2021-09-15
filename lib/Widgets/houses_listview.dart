import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/PropertyItem/house_item.dart';
import 'package:ghaarjaggaa/Providers/rooms_provider.dart';
import 'package:provider/provider.dart';

class HousesListView extends StatelessWidget {
  final String searchText;

  HousesListView({required this.searchText});

  @override
  Widget build(BuildContext context) {
    return searchText == ""
        ? StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('properties')
                .where('propertyType', isEqualTo: 'House')
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: const CircularProgressIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'No Houses Found',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return HouseItem(
                    propertyTitle: snapshot.data!.docs[index]['propertyTitle'],
                    image: snapshot.data!.docs[index]['imageUrl'],
                    price: snapshot.data!.docs[index]['price'],
                    availability: snapshot.data!.docs[index]['propertyTitle'],
                    id: snapshot.data!.docs[index].id,
                    roadAccess: snapshot.data!.docs[index]['roadAccess'],
                    propertyType: snapshot.data!.docs[index]['propertyType'],
                    noOfFloors: snapshot.data!.docs[index]['noOfFloors'],
                    kitchen: snapshot.data!.docs[index]['noOfKitchen'],
                    facilities: [],
                    phoneNumber: snapshot.data!.docs[index]['phoneNumber'],
                    name: snapshot.data!.docs[index]['name'],
                    noOfParking: snapshot.data!.docs[index]['noOfParking'],
                    noOfBathroom: snapshot.data!.docs[index]['noOfBathrooms'],
                    description: snapshot.data!.docs[index]['description'],
                    areaUnit: snapshot.data!.docs[index]['areaUnit'],
                    purpose: snapshot.data!.docs[index]['purpose'],
                    email: snapshot.data!.docs[index]['email'],
                    address: snapshot.data!.docs[index]['address'],
                    builtYear: snapshot.data!.docs[index]['builtYear'],
                    propertyFace: snapshot.data!.docs[index]['propertyFace'],
                    priceUnit: snapshot.data!.docs[index]['priceUnit'],
                    noOfBedroom: snapshot.data!.docs[index]['noOfBedrooms'],
                    propertyArea: snapshot.data!.docs[index]['area'],
                    roadType: snapshot.data!.docs[index]['roadType'],
                    uploadedBy: snapshot.data!.docs[index]['userID'],
                    latitude: snapshot.data!.docs[index]['latitude'],
                    longitude: snapshot.data!.docs[index]['longitude'],
                  );
                },
              );
            },
          )
        : StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('properties')
                .where('propertyType', isEqualTo: 'House')
                .where('address',isGreaterThanOrEqualTo: searchText)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: const CircularProgressIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    'No Houses Found',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return HouseItem(
                    propertyTitle: snapshot.data!.docs[index]['propertyTitle'],
                    image: snapshot.data!.docs[index]['imageUrl'],
                    price: snapshot.data!.docs[index]['price'],
                    availability: snapshot.data!.docs[index]['propertyTitle'],
                    id: snapshot.data!.docs[index].id,
                    roadAccess: snapshot.data!.docs[index]['roadAccess'],
                    propertyType: snapshot.data!.docs[index]['propertyType'],
                    noOfFloors: snapshot.data!.docs[index]['noOfFloors'],
                    kitchen: snapshot.data!.docs[index]['noOfKitchen'],
                    facilities: [],
                    phoneNumber: snapshot.data!.docs[index]['phoneNumber'],
                    name: snapshot.data!.docs[index]['name'],
                    noOfParking: snapshot.data!.docs[index]['noOfParking'],
                    noOfBathroom: snapshot.data!.docs[index]['noOfBathrooms'],
                    description: snapshot.data!.docs[index]['description'],
                    areaUnit: snapshot.data!.docs[index]['areaUnit'],
                    purpose: snapshot.data!.docs[index]['purpose'],
                    email: snapshot.data!.docs[index]['email'],
                    address: snapshot.data!.docs[index]['address'],
                    builtYear: snapshot.data!.docs[index]['builtYear'],
                    propertyFace: snapshot.data!.docs[index]['propertyFace'],
                    priceUnit: snapshot.data!.docs[index]['priceUnit'],
                    noOfBedroom: snapshot.data!.docs[index]['noOfBedrooms'],
                    propertyArea: snapshot.data!.docs[index]['area'],
                    roadType: snapshot.data!.docs[index]['roadType'],
                    uploadedBy: snapshot.data!.docs[index]['userID'],
                    latitude: snapshot.data!.docs[index]['latitude'],
                    longitude: snapshot.data!.docs[index]['longitude'],
                  );
                },
              );
            },
          );
  }
}
