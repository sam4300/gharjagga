import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Models/rooms_models.dart';

class Rooms with ChangeNotifier {
  List<Room> _roomList = [
    Room(
      name: "Luxurious Single Family House",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/1_h123kc.jpg",
    ),
    Room(
      name: "Beautiful Studio Central Park Mall",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/213503505.jpg",
    ),
    Room(
      name: "Modern Scandinavian Apartment",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/f7771c6afc7cc32401286116a7eed6f0.jpg",
    ),
    Room(
      name: "2 BR Spacious",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/family1920x960.jpg",
    ),
    Room(
      name: "Senopati House",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/GettyImages-9261821821-5c69c1b7c9e77c0001675a49.jpg",
    ),
    Room(
      name: "A Bohemian-style New Condo",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/hotel-room-blocks.jpg",
    ),
    Room(
      name: "Cozy & Hygienic Sudirman",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image:
      "assets/living-room-blue-and-white-brown-modern_living-room-layout-and-decor.jpg",
    ),
    Room(
      name: "Offers Room Berjaya Times Square",
      place: "Kuala Lumpur, Malaysia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/offers-room-berjaya-times-square-hotel-kuala-lumpur.jpg",
    ),
    Room(
      name: "Thamrin Residence",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/photo-1554995207-c18c203602cb.jpg",
    ),
    Room(
      name: "Mega Kuningan Bellagio",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/photo-1567767292278-a4f21aa2d36e.jpg",
    ),
    Room(
      name: "ZB ATIL Zook Home 9",
      place: "Jakarta, Indonesia",
      price: "30",
      bath: "2",
      height: "12.5",
      width: "18.5",
      type: "Family",
      rating: "4.5",
      image: "assets/SB-ATL-ZookHome-9-e1538165814448.jpg",
    ),
  ];

  List<Room> get roomsList {
    return [..._roomList];
  }
}