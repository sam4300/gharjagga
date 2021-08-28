import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/Property_Detail_Screens/apartment_details.dart';

class ApartmentItem extends StatelessWidget {
  static const routeName = ("/ApartmentItems");
  final String title;
  final String location;
  final String imageUrl;
  final double price;
  final String availability;

  ApartmentItem(
      {required this.title,
        required this.location,
        required this.imageUrl,
        required this.price,
        required this.availability});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ApartmentDetailScreen.routeName);
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
                            title,
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.white70),
                            maxLines: 2,
                          ),
                          Text(location,
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
                                    "2",
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
                                  Text("2",
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Text("230 m²",
                                  style: TextStyle(color: Colors.white70))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            " Rs $price/mth",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 20),
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
                                    availability,
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
        ));
  }
}
