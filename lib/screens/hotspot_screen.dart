import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotSpotScreen extends StatefulWidget {
  const HotSpotScreen({Key? key}) : super(key: key);

  @override
  _HotSpotScreenState createState() => _HotSpotScreenState();
}

class _HotSpotScreenState extends State<HotSpotScreen> {
  final LatLng _center = const LatLng(45.521563, -122.677433);

  late GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11,
        ),
        onMapCreated: _onMapCreated,
      ),
    );
  }
}
