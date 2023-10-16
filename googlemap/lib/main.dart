import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map ',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        // ColorScheme.fromSwatch ka use primarySwatch parameter ke sath hota hai.
        // SeedColor nahi hota.
        // Material3 ka use enableMaterialSplash parameter ke sath hota hai, not useMaterial3.
        splashFactory: InkRipple.splashFactory,
      ),
      home: const MyHomePage(title: 'Google Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController _mapController;

  void _handleTap(LatLng point) {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: point, zoom: 12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GoogleMap(
          onTap: (argument) {
            _handleTap(argument);
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (controller) {
            _mapController = controller;
          },
          initialCameraPosition: const CameraPosition(
            target: LatLng(40.7128, -74.0060), // New York City coordinates
            zoom: 12,
          ),
          markers: {
            Marker(
              markerId: MarkerId("mymarker"),
              icon: BitmapDescriptor.defaultMarker,
              position: LatLng(40.7128, -74.0060),
              infoWindow: InfoWindow(title: "My Marker"),
            ),
            Marker(
              markerId: MarkerId("marker1"),
              position: LatLng(40.7128, -74.0060),
              infoWindow: InfoWindow(title: "Marker 1"),
            ),
            Marker(
              markerId: MarkerId("marker2"),
              position: LatLng(37.7749, -122.4194),
              infoWindow: InfoWindow(title: "Marker 2"),
            ),
          },
        ),
      ),
    );
  }
}
