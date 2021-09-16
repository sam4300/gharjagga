import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ghaarjaggaa/PropertyItem/nearbyPropertyItem.dart';
import 'package:ghaarjaggaa/Providers/location_provider.dart';
import 'package:provider/provider.dart';

class NearByProperties extends StatefulWidget {
  final double currentUserLatitude;
  final double currentUserLongitude;

  NearByProperties(
      {required this.currentUserLongitude, required this.currentUserLatitude});

  @override
  _NearByPropertiesState createState() => _NearByPropertiesState();
}

class _NearByPropertiesState extends State<NearByProperties> {
  String getDistance(double latitude, double longitude) {
    var distance = Geolocator.distanceBetween(widget.currentUserLatitude,
        widget.currentUserLongitude, latitude, longitude);
    var distanceInKm = distance / 1000;
    return distanceInKm.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('properties').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: const CircularProgressIndicator());
        } else if (snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text(
              'No Properties Found',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          );
        }
        List propertyDistance = [];
        for (int i = 0; i < snapshot.data!.docs.length - 1; i++) {
          var distance = Geolocator.distanceBetween(
              widget.currentUserLatitude,
              widget.currentUserLongitude,
              snapshot.data!.docs[i]['latitude'],
              snapshot.data!.docs[i]['longitude']);
          var distanceInKm = distance / 1000;
          propertyDistance.add(distanceInKm);
        }
        propertyDistance.sort();
        if (propertyDistance[0] > 10) {
          return Container();
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            if (double.parse(
                    getDistance(document['latitude'], document['longitude'])) <=
                3) {
              return NearByPropertyItem(
                propertyTitle: document['propertyTitle'],
                image: document['imageUrl'],
                price: document['price'],
                availability: document['propertyTitle'],
                docId: document.id,
                purpose: document['purpose'],
                propertyType: document['propertyType'],
                propertyArea: document['area'],
                areaUnit: document['areaUnit'],
                propertyFace: document['propertyFace'],
                roadType: document['roadType'],
                priceUnit: document['priceUnit'],
                description: document['description'],
                name: document['name'],
                email: document['email'],
                phoneNumber: document['phoneNumber'],
                roadAccess: document['roadAccess'],
                builtYear: document['builtYear'],
                noOfBedroom: document['noOfBathrooms'],
                noOfBathroom: document['noOfBathrooms'],
                noOfParking: document['noOfParking'],
                noOfFloors: document['noOfFloors'],
                kitchen: document['noOfKitchen'],
                facilities: List.from(document['facilities']),
                address: document['address'],
                uploadedBy: document['userID'],
                latitude: document['latitude'],
                longitude: document['longitude'],
                listedDate: document['createdAt'],
                distanceFromUser: double.parse(
                  getDistance(
                    document['latitude'],
                    document['longitude'],
                  ),
                ),
              );
            } else {
              return Center(child: Container());
            }
          }).toList(),
        );

        // return ListView.builder(
        //   itemCount: snapshot.data!.docs.length,
        //   itemBuilder: (context, index) {
        //     return NearByPropertyItem(
        //       propertyTitle: snapshot.data!.docs[index]['propertyTitle'],
        //       image: snapshot.data!.docs[index]['imageUrl'],
        //       price: snapshot.data!.docs[index]['price'],
        //       availability: snapshot.data!.docs[index]['propertyTitle'],
        //       docId: snapshot.data!.docs[index].id,
        //       roadAccess: snapshot.data!.docs[index]['roadAccess'],
        //       propertyType: snapshot.data!.docs[index]['propertyType'],
        //       noOfFloors: snapshot.data!.docs[index]['noOfFloors'],
        //       kitchen: snapshot.data!.docs[index]['noOfKitchen'],
        //       facilities: List.from(snapshot.data!.docs[index]['facilities']),
        //       phoneNumber: snapshot.data!.docs[index]['phoneNumber'],
        //       name: snapshot.data!.docs[index]['name'],
        //       noOfParking: snapshot.data!.docs[index]['noOfParking'],
        //       noOfBathroom: snapshot.data!.docs[index]['noOfBathrooms'],
        //       description: snapshot.data!.docs[index]['description'],
        //       areaUnit: snapshot.data!.docs[index]['areaUnit'],
        //       purpose: snapshot.data!.docs[index]['purpose'],
        //       email: snapshot.data!.docs[index]['email'],
        //       address: snapshot.data!.docs[index]['address'],
        //       builtYear: snapshot.data!.docs[index]['builtYear'],
        //       propertyFace: snapshot.data!.docs[index]['propertyFace'],
        //       priceUnit: snapshot.data!.docs[index]['priceUnit'],
        //       noOfBedroom: snapshot.data!.docs[index]['noOfBedrooms'],
        //       propertyArea: snapshot.data!.docs[index]['area'],
        //       roadType: snapshot.data!.docs[index]['roadType'],
        //       uploadedBy: snapshot.data!.docs[index]['userID'],
        //       latitude: snapshot.data!.docs[index]['latitude'],
        //       longitude: snapshot.data!.docs[index]['longitude'],
        //       distanceFromUser:
        //       Geolocator.distanceBetween(
        //           widget.currentUserLatitude,
        //           widget.currentUserLongitude,
        //           snapshot.data!.docs[index]['latitude'],
        //           snapshot.data!.docs[index]['longitude']),
        //     );
        //   },
        // );
      },
    );
  }
}
