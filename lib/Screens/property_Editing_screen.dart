import 'dart:core';
import 'dart:ui';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Helpers/database.dart';
import 'package:ghaarjaggaa/Helpers/location_helper.dart';
import 'package:ghaarjaggaa/Screens/Dashboard/tabscreen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import 'map_screen.dart';

class PropertyEditingScreen extends StatefulWidget {
  static const routeName = "/edit_Property";
  final String propertyTitle1;
  final int noOfBedrooms;
  final String docId;
  final String propertyType1;
  final String purpose1;
  final String description1;
  final String propertyFace1;
  final double roadAccess1;
  final int builtYear1;
  final double price1;
  final int noOfFloors1;
  final double propertyArea1;

  PropertyEditingScreen({required this.propertyTitle1,
    required this.noOfBedrooms,
    required this.docId,
    required this.roadAccess1,
    required this.builtYear1,
    required this.description1,
    required this.price1,
    required this.propertyFace1,
    required this.propertyType1,
    required this.purpose1,
    required this.noOfFloors1,
    required this.propertyArea1});


  @override
  _PropertyEditingScreenState createState() => _PropertyEditingScreenState();
}

class _PropertyEditingScreenState extends State<PropertyEditingScreen> {
  final latController = TextEditingController();
  final lonController = TextEditingController();
  bool isEditing = false;
  File? image;
  final _formKey = GlobalKey<FormState>();
  var purpose = "Sell";
  var propertyType = "Apartment";
  var propertyTitle = '';
  var propertyArea = 0.0;
  var areaUnit = "Aana";
  var propertyFace = "East";
  var roadAccess = 0.0;
  var roadType = "Paved";
  var builtYear = 0;
  var noOfBedroom = 0;
  var noOfBathroom = 0;
  var noOfParking = 0;
  var noOfFloors = 0;
  var kitchen = 0;
  List<String> facilities = [];
  var price = 0.0;
  var priceUnit = "/month";
  var address = "";
  var description = "";
  var name = "";
  var email = "";
  var phoneNumber = 0;

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController _nameController = TextEditingController();


  void _loadCurrentUSerData() async {
    await databaseMethods.fetchCurrentUserData();
    setState(() {
      _nameController.text = databaseMethods.name;
    });
  }

  @override
  void initState() {
    _loadCurrentUSerData();

    super.initState();
  }

  final facilitiesList = [
    CheckBoxState(title: "Internet"),
    CheckBoxState(title: "Swimming Pool"),
    CheckBoxState(title: "Cable TV"),
    CheckBoxState(title: "Water Supply"),
    CheckBoxState(title: "Garbage Disposal"),
    CheckBoxState(title: "Garden"),
    CheckBoxState(title: "Peaceful"),
    CheckBoxState(title: "Solar Water"),
    CheckBoxState(title: "Electricity"),
    CheckBoxState(title: "Well"),
    CheckBoxState(title: "Drainage"),
    CheckBoxState(title: "Reserve Tank"),
    CheckBoxState(title: "Earthquake resistant"),
  ];

  Widget builderCheckBox(CheckBoxState checkBox) =>
      ListTile(
        leading: Checkbox(
          activeColor: Colors.green,
          value: checkBox.value,
          onChanged: (value) {
            setState(() {
              checkBox.value = value;
            });
            if (!facilities.contains(checkBox.title)) {
              facilities.add(checkBox.title);
            } else {
              facilities.remove(checkBox.title);
            }
          },
        ),
        title: Text(
          checkBox.title,
          style: TextStyle(color: Colors.white),
        ),
      );

  Future<void> _postToDb(String docId, BuildContext context) async {
    setState(() {
      isEditing = true;
    });
//image uploading
    final ref = FirebaseStorage.instance
        .ref()
        .child('userImages')
        .child(FirebaseFirestore.instance
        .collection('properties')
        .doc()
        .id);
    await ref.putFile(image!);
    final imageUrl = await ref.getDownloadURL();

    // Future<void> downloadURLExample() async {
    //   String downloadURL = await firebase_storage.FirebaseStorage.instance
    //       .ref('users/123/avatar.jpg')
    //       .getDownloadURL();

    FirebaseFirestore.instance
        .collection('favorites')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('myFavorites')
        .doc(docId)
        .update({
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
      'createdAt': Timestamp.now(),
      'userID': FirebaseAuth.instance.currentUser!.uid,
      'imageUrl': imageUrl,
    });
    FirebaseFirestore.instance.collection('properties').doc(docId).update({
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
      'createdAt': Timestamp.now(),
      'userID': FirebaseAuth.instance.currentUser!.uid,
      'imageUrl': imageUrl,
      'latitude':
      latController.text == "" ? 1.1 : double.parse(latController.text),
      'longitude':
      lonController.text == "" ? 1.1 : double.parse(lonController.text),
    });
  }

  Future<void> _trySubmit(String docId, BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      await _postToDb(docId, context);
      setState(() {
        isEditing = false;
      });
      showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            AlertDialog(
              title: Text('Property Successfully Updated'),
              actions: [
                TextButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                        TabScreen.routeName);
                  },
                ),
              ],
            ),
      );
    }
  }

  Future? _getCurrentLocation() async {
    final locData = await Location().getLocation();
    latController.text = locData.latitude.toString();
    lonController.text = locData.longitude.toString();
  }

  Future _takePicture() async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image = File(imageFile!.path);
    });
    Navigator.of(context).pop();
  }

  Future _selectPicture() async {
    final imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(imageFile!.path);
    });
    Navigator.of(context).pop();
  }

  String dropdownValuePurpose = 'Sell';
  String dropdownValueProperty = 'Apartment';
  String dropdownValueAreaUnit = 'Aana';
  String dropdownValuePropertyFace = 'East';
  String dropdownValueRoadType = 'Paved';
  String dropdownValueNumberOfBedrooms = '0';
  String dropdownValueNumberOfBathrooms = '0';
  String dropdownValueNumberOfParking = '0';
  String dropdownValueNumberOfFloors = '0';
  String dropdownValueNumberOfKitchen = '0';
  String dropdownValuePriceUnit = '/month';
  String dropdownValueAddress = "LALITPUR";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text("Update Property"),
          backgroundColor: Colors.grey[700],
          actions: [
            TextButton(
                onPressed: () {
                  _trySubmit(widget.docId, context);
                },
                child: Text(
                  isEditing ? "Updating" : "Update",
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Purpose",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.grey[850],
                            value: dropdownValuePurpose,
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValuePurpose = newValue!;
                                isEditing = true;
                              });
                              purpose = dropdownValuePurpose;
                            },
                            items: <String>['Sell', 'Rent']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Property Type",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.grey[850],
                            value: dropdownValueProperty,
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                            underline: Container(
                              height: 2,
                              color: Colors.deepPurpleAccent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValueProperty = newValue!;
                              });
                              propertyType = dropdownValueProperty;
                            },
                            items: <String>[
                              'Apartment',
                              'House',
                              'Land',
                              'Room'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.grey[900],
                    child: Center(
                      child: Text(
                        "Basic Information",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text("Property Title:",
                      style: TextStyle(color: Colors.green, fontSize: 20)),
                  TextFormField(
                    initialValue: widget.propertyTitle1,
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Enter property title",
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 13),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter suitable title';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      propertyTitle = value!;
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Area:",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20)),
                            TextFormField(
                              initialValue: widget.propertyArea1.toString(),
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "Enter property area covered",
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter suitable area';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                propertyArea = double.parse(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      DropdownButton(
                        dropdownColor: Colors.grey[850],
                        value: dropdownValueAreaUnit,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueAreaUnit = newValue!;
                          });
                          areaUnit = dropdownValueAreaUnit;
                        },
                        items: <String>[
                          'Aana',
                          'Ropani',
                          'sq.Feet',
                          'sq.Meter',
                          'Daam',
                          'Paisa',
                          'Bigha',
                          'Kattha',
                          'Dhur',
                          'Haat'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Text("Property Face:",
                      style: TextStyle(color: Colors.green, fontSize: 20)),
                  DropdownButton(
                    dropdownColor: Colors.grey[850],
                    value: dropdownValuePropertyFace,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValuePropertyFace = newValue!;
                      });
                      propertyFace = dropdownValuePropertyFace;
                    },
                    items: <String>[
                      'N/A',
                      'East',
                      'West',
                      'North',
                      'South',
                      'South East',
                      'South West',
                      'North East',
                      'North West',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Road Access:",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20)),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText: "Enter distance from road in meter",
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter suitable distance';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                roadAccess = double.parse(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      DropdownButton(
                        dropdownColor: Colors.grey[850],
                        value: dropdownValueRoadType,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueRoadType = newValue!;
                          });
                          roadType = dropdownValueRoadType;
                        },
                        items: <String>[
                          'Paved',
                          'Gravelled',
                          'Soil Stabilized',
                          'Blacktopped',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  Container(
                    height: 30,
                    width: double.infinity,
                    color: Colors.grey[900],
                    child: Center(
                      child: Text(
                        "Property Details",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Built Year:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText:
                        "Enter the built year of your property in B.S",
                        hintStyle: TextStyle(color: Colors.white38),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty || value.length != 4) {
                          return 'Please enter suitable year';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        builtYear = int.parse(value!);
                      }),
                  Text(
                    "Number of Bedrooms:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey[850],
                    value: dropdownValueNumberOfBedrooms,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueNumberOfBedrooms = newValue!;
                      });
                      noOfBedroom = int.parse(dropdownValueNumberOfBedrooms);
                    },
                    items: <String>['0', '1', '2', '3', '4', '5']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                    onTap: () {},
                  ),
                  Text(
                    "Number of Bathrooms:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey[850],
                    value: dropdownValueNumberOfBathrooms,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueNumberOfBathrooms = newValue!;
                      });
                      noOfBathroom = int.parse(dropdownValueNumberOfBathrooms);
                    },
                    items: <String>['0', '1', '2', '3', '4', '5']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                  Text(
                    "Number of Parking:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey[850],
                    value: dropdownValueNumberOfParking,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueNumberOfParking = newValue!;
                      });
                      noOfParking = int.parse(dropdownValueNumberOfParking);
                    },
                    items: <String>['0', '1', '2', '3', '4', '5']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                  Text(
                    "Number of Floors:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey[850],
                    value: dropdownValueNumberOfFloors,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueNumberOfFloors = newValue!;
                      });
                      noOfFloors = int.parse(dropdownValueNumberOfFloors);
                    },
                    items: <String>[
                      '0',
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                      '6',
                      '7',
                      '8',
                      '9',
                      '10',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                  Text(
                    "Number of Kitchen:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey[850],
                    value: dropdownValueNumberOfKitchen,
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValueNumberOfKitchen = newValue!;
                      });
                      kitchen = int.parse(dropdownValueNumberOfKitchen);
                    },
                    items: <String>[
                      '0',
                      '1',
                      '2',
                      '3',
                      '4',
                      '5',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                  Text(
                    "Facilities:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 280,
                        width: double.infinity,
                        child: GridView.count(
                          shrinkWrap: true,
                          childAspectRatio: 3.5,
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          children: [
                            ...facilitiesList.map(builderCheckBox).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Price:",
                                style: TextStyle(
                                    color: Colors.green, fontSize: 20)),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              autofocus: false,
                              decoration: InputDecoration(
                                hintText:
                                "Enter price and price unit of the property",
                                hintStyle: TextStyle(
                                    color: Colors.white70, fontSize: 13),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white38),
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter suitable price';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                price = double.parse(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                      DropdownButton(
                        dropdownColor: Colors.grey[850],
                        value: dropdownValuePriceUnit,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValuePriceUnit = newValue!;
                          });
                          priceUnit = dropdownValuePriceUnit;
                        },
                        items: <String>[
                          '/month',
                          '/-',
                          '/ropani',
                          '/sq.Feet',
                          '/sq.Meter',
                          '/Daam',
                          '/Paisa',
                          '/Bigha',
                          '/Kattha',
                          '/Dhur',
                          '/Haat'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.grey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Property Images",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.add, color: Colors.blue),
                              onPressed: () {
                                Dialog dialog = Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ), //this right here
                                  child: Container(
                                    height: 250.0,
                                    width: 200.0,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: ElevatedButton(
                                            onPressed: _takePicture,
                                            child: Text("Capture"),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: ElevatedButton(
                                            onPressed: _selectPicture,
                                            child: Text("Select From Gallery"),
                                          ),
                                        ),
                                        Padding(
                                            padding:
                                            EdgeInsets.only(top: 10.0)),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                            ))
                                      ],
                                    ),
                                  ),
                                );
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) => dialog);
                              })
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  image != null
                      ? Stack(
                    children: [
                      Container(
                          height: 300,
                          width: double.infinity,
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                          right: 0,
                          top: 0,
                          child: IconButton(
                            icon: Icon(Icons.remove, size: 50),
                            color: Colors.red,
                            onPressed: () {
                              setState(() {
                                image = null;
                              });
                            },
                          ))
                    ],
                  )
                      : Container(
                    height: 50,
                    width: double.infinity,
                    child: Text(
                      "Please select at least one image",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.grey[900],
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Add Location For Your Property",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Enter Property Address:",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      DropdownButton(
                        dropdownColor: Colors.grey[850],
                        value: dropdownValueAddress,
                        icon: const Icon(
                          Icons.arrow_downward,
                          color: Colors.white,
                        ),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueAddress = newValue!;
                          });
                          address = dropdownValueAddress;
                        },
                        items: <String>[
                          "LALITPUR",
                          "KATHMANDU",
                          "BHAKTAPUR",
                          "POKHARA",
                          "LAGANKHEL",
                          "GODAWARI",
                          "CHAPAGAUN",
                          "SATDOBATO",
                          "KALANKI",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        isExpanded: true,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Add your current location as property Location:",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                  readOnly: true,
                                  controller: latController,
                                ),
                              ),
                              Text('|',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30)),
                              Expanded(
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                    readOnly: true,
                                    controller: lonController,
                                  ))
                            ],
                          ),
                          ElevatedButton.icon(
                              onPressed: _getCurrentLocation,
                              icon: Icon(Icons.location_on),
                              label: Text(
                                "Current Location",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.grey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add Description of Your Property",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText:
                        "Enter the detailed description of your property",
                        hintStyle: TextStyle(color: Colors.white38),
                        counterStyle: TextStyle(color: Colors.white)),
                    onChanged: (value) {},
                    keyboardType: TextInputType.multiline,
                    maxLength: 10000,
                    style: TextStyle(color: Colors.white),
                    maxLines: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Description cannot be empty";
                      } else if (value.length < 20) {
                        return "Description is not long enough";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      description = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.grey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Add Contact Details:",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Name:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  TextFormField(
                    controller:_nameController,
                    decoration: InputDecoration(
                    hintText: "Enter your name",
                    hintStyle: TextStyle(color: Colors.white38),
                  ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 3) {
                        return 'Please enter suitable name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Email:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  TextFormField(
                    initialValue: FirebaseAuth.instance.currentUser!.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'enter your email',
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return "Enter valid email";
                      }
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Phone Number:",
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Enter your phone number",
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty || value.length != 10) {
                        return "Enter valid phone number";
                      }
                    },
                    onSaved: (value) {
                      phoneNumber = int.parse(value!);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckBoxState {
  final String title;
  bool? value;

  CheckBoxState({this.value = false, required this.title});
}
