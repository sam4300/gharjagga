import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String title;
  final double price;

  MapScreen(
      {required this.longitude,
      required this.latitude,
      required this.title,
      required this.price});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(widget.latitude, widget.longitude),
          infoWindow: InfoWindow(
              title: widget.title, snippet: 'Rs:${widget.price.toString()}')));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.latitude, widget.longitude), zoom: 15),
      ),
    );
  }
}
