import 'package:flutter/cupertino.dart';

class LandModel with ChangeNotifier {
  final String propertyFace;
  final String areaCovered;
  final double accessRoad;
  final String roadType;
  final String description;
  final String availability;
  final double price;
  final String address;

  LandModel(
      {required this.propertyFace,
      required this.areaCovered,
      required this.accessRoad,
      required this.roadType,
      required this.description,
      required this.availability,
      required this.price,
      required this.address});
}
