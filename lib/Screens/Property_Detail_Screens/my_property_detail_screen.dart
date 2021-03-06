import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ghaarjaggaa/PropertiesListing/myPropertyListing.dart';
import 'package:ghaarjaggaa/Screens/property_Editing_screen.dart';
import 'package:readmore/readmore.dart';

class MyPropertyDetailScreen extends StatefulWidget {
  static const routeName = "/myPropertyDetailScreen";

  const MyPropertyDetailScreen({Key? key}) : super(key: key);

  @override
  _MyPropertyDetailScreenState createState() => _MyPropertyDetailScreenState();
}

class _MyPropertyDetailScreenState extends State<MyPropertyDetailScreen> {
  final String uId = FirebaseAuth.instance.currentUser!.uid;
  var _isLoading = false;

  void _deleteFromDatabase(String docId, BuildContext context) async {
    await FirebaseFirestore.instance
        .collection('properties')
        .doc(docId)
        .delete();
    await FirebaseFirestore.instance
        .collection('favorites')
        .doc(uId)
        .collection('myFavorites')
        .doc(docId)
        .delete();
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final propertyTitle = routeArgs['propertyTitle'];
    final image = routeArgs['image'];
    final price = routeArgs['price'];
    final docId = routeArgs['id'].toString();
    final roadAccess = routeArgs['roadAccess'];
    final propertyType = routeArgs['propertyType'];
    final noOfFloors = routeArgs['noOfFloors'];
    final kitchen = routeArgs['kitchen'];
    final facilities = routeArgs['facilities'];
    final phoneNumber = routeArgs['phoneNumber'];
    final name = routeArgs['name'];
    final noOfParking = routeArgs['noOfParking'];
    final noOfBedroom = routeArgs['noOfBedroom'];
    final description = routeArgs['description'];
    final areaUnit = routeArgs['areaUnit'];
    final purpose = routeArgs['purpose'];
    final email = routeArgs['email'];
    final address = routeArgs['address'];
    final builtYear = routeArgs['builtYear'];
    final propertyFace = routeArgs['propertyFace'];
    final priceUnit = routeArgs['priceUnit'];
    final propertyArea = routeArgs['propertyArea'];
    final roadType = routeArgs['roadType'];
    final noOfBathroom = routeArgs['noOfBathroom'];

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title:
                        Text('Are you sure you want to delete this property'),
                    actions: [
                      TextButton(
                        child: const Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                          onPressed: () {
                            _deleteFromDatabase(docId, context);
                          },
                          child: Text("Yes")),
                      _isLoading ? CircularProgressIndicator() : Text(''),
                    ],
                  ),
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PropertyEditingScreen(
                          propertyArea1: double.parse(propertyArea.toString()),
                          noOfFloors1: int.parse(noOfFloors.toString()),
                          propertyTitle1: propertyTitle.toString(),
                          noOfBedrooms: int.parse(noOfBedroom.toString()),
                          docId: docId,
                          builtYear1: int.parse(builtYear.toString()),
                          description1: description.toString(),
                          price1: double.parse(price.toString()),
                          propertyFace1: propertyFace.toString(),
                          propertyType1: propertyType.toString(),
                          purpose1: purpose.toString(),
                          roadAccess1: double.parse(roadAccess.toString()))),
                );
                // Navigator.of(context)
                //     .pushNamed(PropertyEditingScreen.routeName, arguments: {
                //   'propertyTitle': propertyTitle,
                //   'image': image,
                //   'price': price,
                //   'availability': availability,
                //   'id': docId,
                //   'roadAccess': roadAccess,
                //   'propertyType': propertyType,
                //   'noOfFloors': int.parse('$noOfFloors'),
                //   'kitchen': int.parse('$kitchen'),
                //   'facilities': facilities,
                //   'phoneNumber': phoneNumber,
                //   'name': name,
                //   'noOfParking': int.parse('$noOfParking'),
                //   'noOfBathroom': int.parse('$noOfBathroom'),
                //   'description': description,
                //   'areaUnit': areaUnit,
                //   'purpose': purpose,
                //   'email': email,
                //   'address': address,
                //   'builtYear': builtYear,
                //   'propertyFace': propertyFace,
                //   'priceUnit': priceUnit,
                //   'noOfBedroom': int.parse('$noOfBedroom'),
                //   'propertyArea': propertyArea,
                //   'roadType': roadType
                // });
              },
              icon: Icon(Icons.edit)),
        ],
        backgroundColor: Colors.grey[700],
        title: Text("$propertyTitle"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Apartment').snapshots(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      child: Image.network(
                        image.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white12, width: 2),
                        ),
                        height: 230,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$propertyTitle",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.white,
                                  ),
                                  Text("$noOfBedroom",
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Address",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold)),
                              Text("$address",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Price",
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rs: $price$priceUnit",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white12, width: 2)),
                        height: 320,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Overview",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bed,
                                        size: 45,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            "Bedroom",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text("$noOfBedroom",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.bathroom_outlined,
                                          size: 45, color: Colors.white),
                                      SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            "Bathroom",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text("$noOfBathroom",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.directions_car,
                                        size: 45,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            "Parking",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text("$noOfParking",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.apartment,
                                          size: 45, color: Colors.white),
                                      SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            "Floors",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text("$noOfFloors",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.kitchen,
                                          size: 45, color: Colors.white),
                                      SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            "Kitchens",
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text("$kitchen",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Divider(color: Colors.white54),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Property Face",
                                        style: TextStyle(
                                            color: Colors.white38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "$propertyFace",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Built Year",
                                        style: TextStyle(
                                            color: Colors.white38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "$builtYear",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Area Covered",
                                        style: TextStyle(
                                            color: Colors.white38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "$propertyArea",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          Text(
                                            "$areaUnit",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Access Road",
                                        style: TextStyle(
                                            color: Colors.white38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "$roadAccess meter",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Road Type",
                                        style: TextStyle(
                                            color: Colors.white38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "$roadType",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Carpet Area",
                                        style: TextStyle(
                                            color: Colors.white38,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "n/a",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white12, width: 2)),
                        height: 200,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Amenities",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //DescriptionPart
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ReadMoreText(
                          "$description",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                        Divider(color: Colors.white38),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
