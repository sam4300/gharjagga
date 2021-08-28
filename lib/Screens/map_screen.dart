import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  MapScreen(
      {this.isSelecting = false,
      this.initialLocation =
          const PlaceLocation(latitude: 27.7172, longitude: 85.3240)});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your map"),
        actions: [
          if (widget.isSelecting)
            IconButton(
                onPressed: _pickedLocation == null? null : () {
                  Navigator.of(context).pop(_pickedLocation);
                 },
                icon: Icon(Icons.check))
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initialLocation.latitude,
              widget.initialLocation.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? {}
            : {Marker(markerId: MarkerId('m1'), position: _pickedLocation!)},
      ),
    );
  }
}