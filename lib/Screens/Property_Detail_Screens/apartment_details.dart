import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ApartmentDetailScreen extends StatefulWidget {
  static const routeName = "/apartment_detail_screen";

  const ApartmentDetailScreen({Key? key}) : super(key: key);

  @override
  _ApartmentDetailsScreenState createState() => _ApartmentDetailsScreenState();
}

class _ApartmentDetailsScreenState extends State<ApartmentDetailScreen> {
  final String uId = FirebaseAuth.instance.currentUser!.uid;
  var _isFavorite = false;

  void _addToFavorite(
    String imageUrl,
    String purpose,
    String propertyType,
    String propertyTitle,
    double propertyArea,
    String areaUnit,
    String propertyFace,
    double roadAccess,
    String roadType,
    int builtYear,
    int noOfBedroom,
    int noOfBathroom,
    int noOfParking,
    int noOfFloors,
    int kitchen,
    List<String> facilities,
    double price,
    String availability,
    String priceUnit,
    String address,
    String description,
    String name,
    String email,
    String docId,
    int phoneNumber,
    BuildContext context,
  ) async {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    await FirebaseFirestore.instance
        .collection('favorites')
        .doc(uId)
        .collection('myFavorites')
        .doc(docId)
        .set({
      'purpose': purpose,
      'propertyType': propertyType,
      'propertyTitle': propertyTitle,
      'area': propertyArea,
      'areaUnit': areaUnit,
      'propertyFace': propertyFace,
      'roadAccess': roadAccess,
      'roadType': roadType,
      'builtYear': builtYear,
      'noOfBedrooms': noOfBedroom,
      'noOfBathrooms': noOfBathroom,
      'noOfParking': noOfParking,
      'noOfFloors': noOfFloors,
      'noOfKitchen': kitchen,
      'facilities': facilities,
      'price': price,
      'priceUnit': priceUnit,
      'address': address,
      'description': description,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'isFavorite': _isFavorite,
      'userID': FirebaseAuth.instance.currentUser!.uid,
      'imageUrl': imageUrl,
    });
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final propertyTitle = routeArgs['propertyTitle'].toString();
    final image = routeArgs['image'].toString();
    final price = routeArgs['price'];
    final availability = routeArgs['availability'].toString();
    final docId = routeArgs['id'].toString();
    final roadAccess = routeArgs['roadAccess'];
    final propertyType = routeArgs['propertyType'].toString();
    final noOfFloors = routeArgs['noOfFloors'];
    final kitchen = routeArgs['kitchen'];
    final List<String> facilities = routeArgs['facilities'] as List<String>;
    final phoneNumber = routeArgs['phoneNumber'];
    final name = routeArgs['name'].toString();
    final noOfParking = routeArgs['noOfParking'];
    final noOfBedroom = routeArgs['noOfBedroom'];
    final description = routeArgs['description'].toString();
    final areaUnit = routeArgs['areaUnit'].toString();
    final purpose = routeArgs['purpose'].toString();
    final email = routeArgs['email'].toString();
    final address = routeArgs['address'].toString();
    final builtYear = routeArgs['builtYear'];
    final propertyFace = routeArgs['propertyFace'].toString();
    final priceUnit = routeArgs['priceUnit'].toString();
    final propertyArea = routeArgs['propertyArea'];
    final roadType = routeArgs['roadType'].toString();
    final noOfBathroom = routeArgs['noOfBathroom'];

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
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
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('favorites')
                              .doc(uId)
                              .collection('myFavorites')
                              .doc(docId)
                              .get(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                !snapshot.data!.exists) {
                              return IconButton(
                                onPressed: () {
                                  _addToFavorite(
                                    image,
                                    purpose,
                                    propertyType.toString(),
                                    propertyTitle.toString(),
                                    double.parse('$propertyArea'),
                                    areaUnit.toString(),
                                    propertyFace.toString(),
                                    double.parse('$roadAccess'),
                                    roadType.toString(),
                                    int.parse('$builtYear'),
                                    int.parse('$noOfBedroom'),
                                    int.parse('$noOfBathroom'),
                                    int.parse('$noOfParking'),
                                    int.parse('$noOfFloors'),
                                    int.parse('$kitchen'),
                                    facilities,
                                    double.parse('$price'),
                                    availability,
                                    priceUnit,
                                    address,
                                    description,
                                    name,
                                    email,
                                    docId,
                                    int.parse('$phoneNumber'),
                                    context,
                                  );
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 60,
                                  color: Colors.white,
                                ),
                              );
                            }
                            return IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('favorites')
                                    .doc(uId)
                                    .collection('myFavorites')
                                    .doc(docId)
                                    .update({'isFavorite': _isFavorite});

                                setState(() {
                                  _isFavorite = !_isFavorite;
                                });
                              },
                              icon: snapshot.data!['isFavorite']
                                  ? Icon(
                                      Icons.favorite,
                                      size: 60,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_border,
                                      size: 60,
                                      color: Colors.white,
                                    ),
                            );
                          }),
                      bottom: 34,
                      right: 30,
                    ),
                  ]),
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
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Negotiable",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white12, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 20, child: Icon(Icons.person)),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "$name",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Text("$phoneNumber",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15))
                              ],
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: Text("Contact now"),
                                style: TextButton.styleFrom(
                                    primary: Colors.white,
                                    backgroundColor: Colors.green),
                              ),
                            ),
                          ],
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
