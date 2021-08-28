import 'package:flutter/material.dart';
class Room with ChangeNotifier{
  final String name;
  final String place;
  final String price;
  final String height;
  final String width;
  final String bath;
  final String type;
  final String rating;
  final String image;
  Room(
      {required this.bath,
        required this.height,
        required this.name,
        required this.place,
        required this.price,
        required this.type,
        required this.width,
        required this.rating,
        required this.image});
}

