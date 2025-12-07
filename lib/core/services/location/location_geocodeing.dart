import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationGeoCoding {
  Future<String> getMyAddress({required LatLng latLng}) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      return "${placemarks.first.country} ${placemarks.first.administrativeArea}";
    } catch (error) {
      return "";
    }
  }
}
