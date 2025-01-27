class GeolocationEntity {
  final num latitude;
  final num longitude;

  GeolocationEntity(this.latitude, this.longitude);

  toJson() => {
    "latitude": latitude,
    "longitude": longitude
  };
}