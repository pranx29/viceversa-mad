import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class GeoLocator {
  static GeoLocator get instance => Get.find();

  Future<Position> determinePosition() async {
    // Check if location services are enabled
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled return an error message
      return Future.error('Location services are disabled.');
    }

    // Check location permissions
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // If permissions are granted, return the current location
    return await Geolocator.getCurrentPosition();
  }

  Future<String> getCountry() async {
    try {
      // Get current position
      Position position = await GeoLocator.instance.determinePosition();

      // Reverse geocode to get place details
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      // Extract and return the country
      if (placemarks.isNotEmpty) {
        return placemarks[0].country ?? 'Country not found';
      } else {
        return 'Country not found';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }
}
