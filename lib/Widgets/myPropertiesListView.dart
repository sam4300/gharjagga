import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/PropertyItem/my_property_item.dart';

class MyPropertyListView extends StatefulWidget {
  @override
  _MyPropertyListViewState createState() => _MyPropertyListViewState();
}

@override
class _MyPropertyListViewState extends State<MyPropertyListView> {
  String? get email {
    final user = FirebaseAuth.instance.currentUser;
    return user!.email;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('properties')
          .where('userID', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: const CircularProgressIndicator());
        }
        else if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              'You have not posted any property',
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
            return MyPropertyItem(
              propertyTitle: snapshot.data!.docs[index]['propertyTitle'],
              image: snapshot.data!.docs[index]['imageUrl'],
              price: snapshot.data!.docs[index]['price'],
              availability: snapshot.data!.docs[index]['propertyTitle'],
              docId: snapshot.data!.docs[index].id,
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
              latitude: snapshot.data!.docs[index]['latitude'],
              longitude: snapshot.data!.docs[index]['longitude'],
            );
          },
        );
      },
    );
  }
}
//
// ListView(
// children: snapshot.data!.docs.map((document) {
// return ApartmentItem(
// title: document['propertyTitle'],
// location: document['address'],
// imageUrl: document['name'],
// price: document['price'],
// availability: document['name']);
// }).toList(),
// );
