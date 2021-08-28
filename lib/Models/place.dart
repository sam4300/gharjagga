class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  const PlaceLocation({
    required this.longitude,
    required this.latitude,
    this.address,
  });
}
