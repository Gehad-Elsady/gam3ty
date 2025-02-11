// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UniLocation extends StatefulWidget {
  double longitude;
  double latitude;

  UniLocation({required this.longitude, required this.latitude});

  @override
  State<UniLocation> createState() => _UniLocationState();
}

class _UniLocationState extends State<UniLocation> {
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  Location location = Location();
  LocationData? locationData;

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool _serviceEnabled = true;

  late Marker initialMarker;
  Marker? userMarker;
  Polyline? routePolyline;

  @override
  void initState() {
    super.initState();
    _initializeMarkersAndRoute();
  }

  Future<void> _initializeMarkersAndRoute() async {
    // Create a marker for the initial position
    initialMarker = Marker(
      markerId: MarkerId("initial_position"),
      position: LatLng(widget.latitude, widget.longitude),
      infoWindow: InfoWindow(
        title: "Initial Position",
        snippet: "(${widget.latitude}, ${widget.longitude})",
      ),
    );

    // Get the user's current location
    if (await isPermissionGranted() && await isServicesEnabled()) {
      locationData = await location.getLocation();
      if (locationData != null) {
        final userPosition = LatLng(
          locationData!.latitude!,
          locationData!.longitude!,
        );

        // Create a marker for the user's position
        userMarker = Marker(
          markerId: MarkerId("user_position"),
          position: userPosition,
          infoWindow: InfoWindow(
            title: "Your Location",
            snippet: "(${locationData!.latitude}, ${locationData!.longitude})",
          ),
        );

        // Create a polyline between the user's location and the initial position
        routePolyline = Polyline(
          polylineId: PolylineId("route"),
          points: [
            userPosition,
            LatLng(widget.latitude, widget.longitude),
          ],
          color: Colors.blue,
          width: 5,
        );

        // Refresh the UI to show the new markers and polyline
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      zoomControlsEnabled: false,
      cameraTargetBounds: CameraTargetBounds(
        LatLngBounds(
          northeast: LatLng(31.916667, 35.000000), // Top right corner of Egypt
          southwest:
              LatLng(22.000000, 25.000000), // Bottom left corner of Egypt
        ),
      ),
      initialCameraPosition: CameraPosition(
        target: LatLng(
            widget.latitude, widget.longitude), // Default to Cairo, Egypt
        zoom: 18.0,
      ),
      markers: {
        initialMarker,
        if (userMarker != null) userMarker!,
      },
      polylines: {
        if (routePolyline != null) routePolyline!,
      },
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }

  Future<bool> isPermissionGranted() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }
    return _permissionGranted == PermissionStatus.granted;
  }

  Future<bool> isServicesEnabled() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    return _serviceEnabled;
  }
}
