// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:ghaarjaggaa/PropertyItem/apartment_item.dart';
// import 'package:ghaarjaggaa/PropertyItem/favorites_item.dart';
// import 'package:ghaarjaggaa/PropertyItem/my_property_item.dart';
// import 'package:ghaarjaggaa/Providers/dbProvider.dart';
//
// class FavoriteListView extends StatefulWidget {
//   @override
//   _FavoriteListViewState createState() => _FavoriteListViewState();
// }
//
// @override
// class _FavoriteListViewState extends State<FavoriteListView> {
//   String? get email {
//     final user = FirebaseAuth.instance.currentUser;
//     return user!.email;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('favorites')
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .collection('myFavorites')
//           .where('isFavorite', isEqualTo:true)
//           .snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: const CircularProgressIndicator());
//         }
//         return ListView.builder(
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             return FavoriteItems(
//               propertyTitle: snapshot.data!.docs[index]['propertyTitle'],
//               image: snapshot.data!.docs[index]['propertyTitle'],
//               price: snapshot.data!.docs[index]['price'],
//               availability: snapshot.data!.docs[index]['propertyTitle'],
//               docId: snapshot.data!.docs[index].id,
//               roadAccess: snapshot.data!.docs[index]['roadAccess'],
//               propertyType: snapshot.data!.docs[index]['propertyType'],
//               noOfFloors: snapshot.data!.docs[index]['noOfFloors'],
//               kitchen: snapshot.data!.docs[index]['noOfKitchen'],
//               facilities: [],
//               phoneNumber: snapshot.data!.docs[index]['phoneNumber'],
//               name: snapshot.data!.docs[index]['name'],
//               noOfParking: snapshot.data!.docs[index]['noOfParking'],
//               noOfBathroom: snapshot.data!.docs[index]['noOfBathrooms'],
//               description: snapshot.data!.docs[index]['description'],
//               areaUnit: snapshot.data!.docs[index]['areaUnit'],
//               purpose: snapshot.data!.docs[index]['purpose'],
//               email: snapshot.data!.docs[index]['email'],
//               address: snapshot.data!.docs[index]['address'],
//               builtYear: snapshot.data!.docs[index]['builtYear'],
//               propertyFace: snapshot.data!.docs[index]['propertyFace'],
//               priceUnit: snapshot.data!.docs[index]['priceUnit'],
//               noOfBedroom: snapshot.data!.docs[index]['noOfBedrooms'],
//               propertyArea: snapshot.data!.docs[index]['area'],
//               roadType: snapshot.data!.docs[index]['roadType'],
//             );
//           },
//         );
//       },
//     );
//   }
// }
// //
// // ListView(
// // children: snapshot.data!.docs.map((document) {
// // return ApartmentItem(
// // title: document['propertyTitle'],
// // location: document['address'],
// // imageUrl: document['name'],
// // price: document['price'],
// // availability: document['name']);
// // }).toList(),
// // );