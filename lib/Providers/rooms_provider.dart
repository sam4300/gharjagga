import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Models/apartment_model.dart';

class Rooms with ChangeNotifier {
  List<Buildings> _roomList = [];

  List<Buildings> get roomsList {
    return [..._roomList];
  }


}
