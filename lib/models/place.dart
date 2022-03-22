import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  PlaceLocation(
      {required this.latitude, required this.longitude, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image; // each image is a file in our device

  Place({
    required this.id,
    required this.title,
    required this.image,
    required this.location,
  });
}
