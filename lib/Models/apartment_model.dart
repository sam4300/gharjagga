import 'dart:io';
import 'package:flutter/material.dart';

class Buildings with ChangeNotifier {
  final String title;
  final String area;
  final String address;
  final String areaUnit;
  final String propertyFace;
  final String description;
  final double roadAccess;
  final String roadType;
  final String builtYear;
  final int bedrooms;
  final String availability;
  final int bathrooms;
  final int parking;
  final int floors;
  final int kitchens;
  final List<String> facilities;
  final File image;
  final double price;

  Buildings(
      {required this.address,
      required this.availability,
      required this.title,
      required this.description,
      required this.area,
      required this.areaUnit,
      required this.propertyFace,
      required this.roadAccess,
      required this.roadType,
      required this.builtYear,
      required this.bedrooms,
      required this.bathrooms,
      required this.parking,
      required this.floors,
      required this.kitchens,
      required this.facilities,
      required this.image,
      required this.price});
}
