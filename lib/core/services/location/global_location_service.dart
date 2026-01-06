import 'dart:io';
import 'package:geolocator/geolocator.dart' hide LocationAccuracy;
import 'package:geolocator/geolocator.dart' as geolocator show LocationAccuracy;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart' hide PermissionStatus;
import 'package:location/location.dart' as location show PermissionStatus;
import 'package:permission_handler/permission_handler.dart';


@LazySingleton()
class GlobalLocationService {
  final Location _location = Location();
  Position? _cachedPosition;
  DateTime? _lastLocationUpdate;
  static const Duration _cacheValidity = Duration(minutes: 5);

  /// Get current location with automatic permission handling
  /// 
  /// Returns [LatLng] if successful, null if permission denied or error occurred
  Future<LatLng?> getCurrentLocation({
    bool forceRefresh = false,
    bool useCache = true,
  }) async {
    try {
      // Check cache first if enabled
      if (useCache && 
          _cachedPosition != null && 
          _lastLocationUpdate != null &&
          DateTime.now().difference(_lastLocationUpdate!) < _cacheValidity) {
        return LatLng(_cachedPosition!.latitude, _cachedPosition!.longitude);
      }

      // Check and request permissions
      final hasPermission = await _checkAndRequestPermissions();
      if (!hasPermission) {
        return null;
      }

      // Check if location services are enabled
      final serviceEnabled = await _checkLocationService();
      if (!serviceEnabled) {
        return null;
      }

      // Get location based on platform
      Position position;
      if (Platform.isAndroid) {
        final locationData = await _location.getLocation();
        position = Position(
          latitude: locationData.latitude ?? 0.0,
          longitude: locationData.longitude ?? 0.0,
          timestamp: DateTime.now(),
          accuracy: locationData.accuracy ?? 0.0,
          altitude: locationData.altitude ?? 0.0,
          heading: locationData.heading ?? 0.0,
          speed: locationData.speed ?? 0.0,
          speedAccuracy: 0.0,
          altitudeAccuracy: 0.0,
          headingAccuracy: 0.0,
        );
      } else {
        position = await Geolocator.getCurrentPosition(
          desiredAccuracy: geolocator.LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10),
        );
      }

      // Validate position
      if (position.latitude == 0.0 && position.longitude == 0.0) {
        return null;
      }

      // Cache the position
      _cachedPosition = position;
      _lastLocationUpdate = DateTime.now();

      return LatLng(position.latitude, position.longitude);
    } catch (e) {
      // Handle any errors gracefully
      return null;
    }
  }

  /// Check if location permission is granted
  Future<bool> hasLocationPermission() async {
    if (Platform.isAndroid) {
      final status = await Permission.location.status;
      return status.isGranted;
    } else {
      final status = await Geolocator.checkPermission();
      return status == LocationPermission.always || 
             status == LocationPermission.whileInUse;
    }
  }

  /// Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await _checkLocationService();
  }

  /// Request location permission explicitly
  Future<bool> requestLocationPermission() async {
    return await _checkAndRequestPermissions();
  }

  /// Get last known location (cached or from device)
  Future<LatLng?> getLastKnownLocation() async {
    try {
      // Return cached if available
      if (_cachedPosition != null) {
        return LatLng(_cachedPosition!.latitude, _cachedPosition!.longitude);
      }

        // Try to get last known position from device
      Position? position;
      if (Platform.isAndroid) {
        final locationData = await _location.getLocation();
        if (locationData.latitude != null && locationData.longitude != null) {
          position = Position(
            latitude: locationData.latitude!,
            longitude: locationData.longitude!,
            timestamp: DateTime.now(),
            accuracy: locationData.accuracy ?? 0.0,
            altitude: locationData.altitude ?? 0.0,
            heading: locationData.heading ?? 0.0,
            speed: locationData.speed ?? 0.0,
            speedAccuracy: 0.0,
            altitudeAccuracy: 0.0,
            headingAccuracy: 0.0,
          );
        }
      } else {
        position = await Geolocator.getLastKnownPosition();
      }

      if (position != null) {
        _cachedPosition = position;
        _lastLocationUpdate = DateTime.now();
        return LatLng(position.latitude, position.longitude);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  /// Clear cached location
  void clearCache() {
    _cachedPosition = null;
    _lastLocationUpdate = null;
  }

  /// Calculate distance between two points in kilometers
  double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2) / 1000;
  }

  /// Calculate distance between two LatLng points in kilometers
  double calculateDistanceBetweenLatLng(LatLng point1, LatLng point2) {
    return calculateDistance(
      point1.latitude,
      point1.longitude,
      point2.latitude,
      point2.longitude,
    );
  }

  // ============================================================================
  // PRIVATE HELPER METHODS
  // ============================================================================

  /// Check and request location permissions
  Future<bool> _checkAndRequestPermissions() async {
    try {
      if (Platform.isAndroid) {
        // Check if location service is enabled
        bool serviceEnabled = await _location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await _location.requestService();
          if (!serviceEnabled) {
            return false;
          }
        }

        // Check permission status
        location.PermissionStatus permissionStatus = await _location.hasPermission();
        if (permissionStatus == location.PermissionStatus.denied) {
          permissionStatus = await _location.requestPermission();
          if (permissionStatus != location.PermissionStatus.granted) {
            return false;
          }
        }

        // Also check with permission_handler for better control
        final status = await Permission.location.status;
        if (status.isDenied) {
          final result = await Permission.location.request();
          return result.isGranted;
        }

        return status.isGranted;
      } else {
        // iOS
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return false;
          }
        }

        if (permission == LocationPermission.deniedForever) {
          return false;
        }

        return true;
      }
    } catch (e) {
      return false;
    }
  }

  /// Check if location service is enabled
  Future<bool> _checkLocationService() async {
    try {
      if (Platform.isAndroid) {
        bool serviceEnabled = await _location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await _location.requestService();
        }
        return serviceEnabled;
      } else {
        return await Geolocator.isLocationServiceEnabled();
      }
    } catch (e) {
      return false;
    }
  }
}

