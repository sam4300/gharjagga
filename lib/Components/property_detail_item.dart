// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:readmore/readmore.dart';
//
// class PropertyDetailItem extends StatefulWidget {
//   final String image;
//   final String purpose;
//   final String propertyType;
//   final String propertyTitle;
//   final double propertyArea;
//   final String areaUnit;
//   final String propertyFace;
//   final double roadAccess;
//   final String roadType;
//   final int builtYear;
//   final int noOfBedroom;
//   final int noOfBathroom;
//   final int noOfParking;
//   final int noOfFloors;
//   final int kitchen;
//   final List<String> facilities;
//   final double price;
//   final String availability;
//   final String priceUnit;
//   final String address;
//   final String description;
//   final String name;
//   final String email;
//   final String id;
//   final int phoneNumber;
//
//   PropertyDetailItem({
//     required this.propertyTitle,
//     required this.image,
//     required this.price,
//     required this.availability,
//     required this.id,
//     required this.purpose,
//     required this.propertyType,
//     required this.propertyArea,
//     required this.areaUnit,
//     required this.propertyFace,
//     required this.roadType,
//     required this.priceUnit,
//     required this.description,
//     required this.name,
//     required this.email,
//     required this.phoneNumber,
//     required this.roadAccess,
//     required this.builtYear,
//     required this.noOfBedroom,
//     required this.noOfBathroom,
//     required this.noOfParking,
//     required this.noOfFloors,
//     required this.kitchen,
//     required this.facilities,
//     required this.address,
//   });
//
//   @override
//   _PropertyDetailItemState createState() => _PropertyDetailItemState();
// }
//
// class _PropertyDetailItemState extends State<PropertyDetailItem> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: StreamBuilder<QuerySnapshot>(
//           stream:
//               FirebaseFirestore.instance.collection('Apartment').snapshots(),
//           builder: (context, snapshot) {
//             return Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Container(
//                     height: 250,
//                     width: double.infinity,
//                     child: Image.asset(
//                       "assets/images/apartment.jpg",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white12, width: 2),
//                       ),
//                       height: 200,
//                       width: double.infinity,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "$widget.widget.propertyTitle",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 19),
//                             ),
//                             SizedBox(height: 5),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.access_time_outlined,
//                                   color: Colors.white,
//                                 ),
//                                 Text("$widget.noOfBedroom",
//                                     style: TextStyle(color: Colors.white)),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text("Address",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 19,
//                                     fontWeight: FontWeight.bold)),
//                             Text("$widget.address",
//                                 style: TextStyle(color: Colors.white)),
//                             SizedBox(
//                               height: 15,
//                             ),
//                             Text(
//                               "Price",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "Rs: $widget.price$widget.priceUnit",
//                                   style: TextStyle(
//                                       color: Colors.blue,
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     "Negotiable",
//                                     style: TextStyle(
//                                         color: Colors.green,
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Container(
//                     height: 100,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white12, width: 2)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           CircleAvatar(radius: 20, child: Icon(Icons.person)),
//                           SizedBox(
//                             width: 10,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Text(
//                                 "$widget.name",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20),
//                               ),
//                               Text("$widget.phoneNumber",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15))
//                             ],
//                           ),
//                           SizedBox(
//                             width: 60,
//                           ),
//                           Expanded(
//                             child: TextButton(
//                               onPressed: () {},
//                               child: Text("Contact now"),
//                               style: TextButton.styleFrom(
//                                   primary: Colors.white,
//                                   backgroundColor: Colors.green),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white12, width: 2)),
//                       height: 320,
//                       width: double.infinity,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Overview",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.bed,
//                                       size: 45,
//                                       color: Colors.white,
//                                     ),
//                                     SizedBox(width: 5),
//                                     Column(
//                                       children: [
//                                         Text(
//                                           "Bedroom",
//                                           style: TextStyle(
//                                               color: Colors.white38,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text("$widget.noOfBedroom",
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.bathroom_outlined,
//                                         size: 45, color: Colors.white),
//                                     SizedBox(width: 5),
//                                     Column(
//                                       children: [
//                                         Text(
//                                           "Bathroom",
//                                           style: TextStyle(
//                                               color: Colors.white38,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text("$widget.noOfBathroom",
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(
//                                       Icons.directions_car,
//                                       size: 45,
//                                       color: Colors.white,
//                                     ),
//                                     SizedBox(width: 5),
//                                     Column(
//                                       children: [
//                                         Text(
//                                           "Parking",
//                                           style: TextStyle(
//                                               color: Colors.white38,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text("$widget.noOfParking",
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.apartment,
//                                         size: 45, color: Colors.white),
//                                     SizedBox(width: 5),
//                                     Column(
//                                       children: [
//                                         Text(
//                                           "Floors",
//                                           style: TextStyle(
//                                               color: Colors.white38,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text("$widget.noOfFloors",
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 Row(
//                                   children: [
//                                     Icon(Icons.kitchen,
//                                         size: 45, color: Colors.white),
//                                     SizedBox(width: 5),
//                                     Column(
//                                       children: [
//                                         Text(
//                                           "Kitchens",
//                                           style: TextStyle(
//                                               color: Colors.white38,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text("$widget.kitchen",
//                                             style:
//                                                 TextStyle(color: Colors.white)),
//                                       ],
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                             Divider(color: Colors.white54),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Property Face",
//                                       style: TextStyle(
//                                           color: Colors.white38,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "$widget.propertyFace",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Built Year",
//                                       style: TextStyle(
//                                           color: Colors.white38,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "$widget.builtYear",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Area Covered",
//                                       style: TextStyle(
//                                           color: Colors.white38,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.end,
//                                       children: [
//                                         Text(
//                                           "$widget.propertyArea",
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                         Text(
//                                           "$widget.areaUnit",
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Access Road",
//                                       style: TextStyle(
//                                           color: Colors.white38,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "$widget.roadAccess meter",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Road Type",
//                                       style: TextStyle(
//                                           color: Colors.white38,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "$widget.roadType",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Carpet Area",
//                                       style: TextStyle(
//                                           color: Colors.white38,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(
//                                       height: 5,
//                                     ),
//                                     Text(
//                                       "n/a",
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white12, width: 2)),
//                       height: 200,
//                       width: double.infinity,
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Amenities",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //DescriptionPart
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Description",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       ReadMoreText(
//                         "$widget.description",
//                         style: TextStyle(color: Colors.white, fontSize: 14),
//                       ),
//                       Divider(color: Colors.white38),
//                     ],
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
