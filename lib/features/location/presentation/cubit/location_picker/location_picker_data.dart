import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPickerData {
  final LatLng? currentLocation;

  final Set<Marker>? markers;

  LocationPickerData({this.currentLocation, this.markers = const {}});
}
