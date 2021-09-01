import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/Property_Detail_Screens/apartment_details.dart';

class ApartmentItem extends StatelessWidget {
  static const routeName = ("/ApartmentItems");

  final String image;
  final String purpose;
  final String propertyType;
  final String propertyTitle;
  final double propertyArea;
  final String areaUnit;
  final String propertyFace;
  final double roadAccess;
  final String roadType;
  final int builtYear;
  final int noOfBedroom;
  final int noOfBathroom;
  final int noOfParking;
  final int noOfFloors;
  final int kitchen;
  final List<String> facilities;
  final double price;
  final String availability;
  final String priceUnit;
  final String address;
  final String description;
  final String name;
  final String email;
  final String id;
  final int phoneNumber;

  ApartmentItem({
    required this.propertyTitle,
    required this.image,
    required this.price,
    required this.availability,
    required this.id,
    required this.purpose,
    required this.propertyType,
    required this.propertyArea,
    required this.areaUnit,
    required this.propertyFace,
    required this.roadType,
    required this.priceUnit,
    required this.description,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.roadAccess,
    required this.builtYear,
    required this.noOfBedroom,
    required this.noOfBathroom,
    required this.noOfParking,
    required this.noOfFloors,
    required this.kitchen,
    required this.facilities,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ApartmentDetailScreen.routeName, arguments: {
              'propertyTitle': propertyTitle,
              'image': image,
              'price': price,
              'availability': availability,
              'id': id,
              'roadAccess': roadAccess,
              'propertyType': propertyType,
              'noOfFloors': noOfFloors,
              'kitchen': kitchen,
              'facilities': facilities,
              'phoneNumber': phoneNumber,
              'name': name,
              'noOfParking': noOfParking,
              'noOfBathroom': noOfBedroom,
              'description': description,
              'areaUnit': areaUnit,
              'purpose': purpose,
              'email': email,
              'address': address,
              'builtYear': builtYear,
              'propertyFace': propertyFace,
              'priceUnit': priceUnit,
              'noOfBedroom': noOfBedroom,
              'propertyArea': propertyArea,
              'roadType': roadType
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.height / 4.5,
                width: size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    child: Image.asset(
                      "assets/images/apartment.jpg",
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: size.height / 4.5,
                width: size.width / 2,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          propertyTitle,
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70),
                          maxLines: 2,
                        ),
                        Text(address,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.bed,
                                  color: Colors.white70,
                                ),
                                Text(
                                  "$noOfBedroom",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.bathtub_outlined,
                                  color: Colors.white70,
                                ),
                                Text("$noOfBathroom",
                                    style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("$propertyArea",
                                    style: TextStyle(color: Colors.white70)),
                                Text("$areaUnit",
                                    style: TextStyle(color: Colors.white70)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          " Rs:$price$priceUnit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.access_time_outlined,
                              color: Colors.white70,
                            ),
                            Text("Time",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                ),
                                Text(
                                  "available",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
