import 'dart:ui';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Helpers/location_helper.dart';
import 'package:ghaarjaggaa/Widgets/add_property_widgets/facility_checkboxes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

import '../map_screen.dart';

class AddProduct extends StatefulWidget {
  static const routeName = "/addProperty";

  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _storeImage;
  String? _previewImageUrl;

  void _showPreview(double lat, double lng) {
    final staticMapUrl =
        LocationHelper.locationPreview(latitude: lat, longitude: lng);
    setState(() {
      _previewImageUrl = staticMapUrl;
    });
  }

  Future<void> _selectOnMap() async {
    final selectedLocation =
        await Navigator.of(context).push<LatLng>(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (ctx) => MapScreen(
                  isSelecting: true,
                )));
    if (selectedLocation == null) {
      return;
    }
    _showPreview(selectedLocation.latitude, selectedLocation.longitude);
  }

  Future? _getCurrentLocation() async {
    final locData = await Location().getLocation();
    _showPreview(locData.latitude!, locData.longitude!);
  }

  Future _takePicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _storeImage = File(imageFile!.path);
    });
    Navigator.of(context).pop();
  }

  Future _selectPicture() async {
    final picker = ImagePicker();
    final imageFile =
        await picker.pickImage(source: ImageSource.gallery, maxWidth: 600);
    setState(() {
      _storeImage = File(imageFile!.path);
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          title: Text("Add Property"),
          backgroundColor: Colors.grey[700],
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 22, color: Colors.green),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
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
                              });
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
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Enter property title",
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 13),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
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
                    },
                    items: <String>[
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
                    decoration: InputDecoration(
                      hintText: "Enter the built year of your property in B.S",
                      hintStyle: TextStyle(color: Colors.white38),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
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
                  FacilitiesCheckBoxes(),
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
                                      borderRadius: BorderRadius.circular(
                                          12.0)), //this right here
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
                  _storeImage != null
                      ? Stack(
                          children: [
                            Container(
                                height: 300,
                                width: double.infinity,
                                child: Image.file(
                                  _storeImage!,
                                  fit: BoxFit.cover,
                                )),
                            Positioned(
                                right: 0,
                                top: 0,
                                child: IconButton(
                                  icon: Icon(Icons.remove, size: 50),
                                  color: Colors.red,
                                  onPressed: () {},
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
                      _previewImageUrl == null
                          ? Column(
                              children: [
                                Text(
                                  'No location chosen',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: _getCurrentLocation,
                                        icon: Icon(Icons.location_on),
                                        label: Text(
                                          "Current Location",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    ElevatedButton.icon(
                                        onPressed: _selectOnMap,
                                        icon: Icon(Icons.map),
                                        label: Text(
                                          "Add Location",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                )
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blue),
                                  ),
                                  height: 200,
                                  width: double.infinity,
                                  child: Image.network(
                                    _previewImageUrl!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton.icon(
                                        onPressed: _getCurrentLocation,
                                        icon: Icon(Icons.location_on),
                                        label: Text(
                                          "Current Location",
                                          style: TextStyle(color: Colors.white),
                                        )),
                                    ElevatedButton.icon(
                                        onPressed: _selectOnMap,
                                        icon: Icon(Icons.map),
                                        label: Text(
                                          "Add Location",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                )
                              ],
                            ),
                    ],
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
