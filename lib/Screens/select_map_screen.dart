import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Providers/location_provider.dart';
import 'package:ghaarjaggaa/Screens/TabScreens/addProduct.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MapSelectionScreen extends StatefulWidget {
  final double latitude;
  final double longitude;

  MapSelectionScreen(this.latitude, this.longitude);

  @override
  _MapSelectionScreenState createState() => _MapSelectionScreenState();
}

class _MapSelectionScreenState extends State<MapSelectionScreen> {
  GoogleMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Select Location"),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 610,
              child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.latitude, widget.longitude),
                    zoom: 15,
                  ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  mapType: MapType.normal,
                  mapToolbarEnabled: true,
                  onCameraMove: (CameraPosition position) {
                    locationData.onCameraMove(position);
                  },
                  onMapCreated: onCreated,
                  onCameraIdle: () {
                    locationData.getMoveCamera();
                  }),
            ),
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            Center(child:SpinKitPulse(
              color: Colors.green,
              size: 100,
            )),
            Positioned(
              bottom: 0,
              child: Container(
                height: 153,
                width: 400,
                child: Column(
                  children: [
                    Text("lat: ${locationData.latitude}"),
                    Text("lng:${locationData.longitude}"),
                    Text(
                      "${locationData.selectedAddress}",
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 110,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.of(context).pushReplacementNamed(AddProduct.routeName);
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Confirm Location",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
