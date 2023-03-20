class GeoDirection {
  final double lat;
  final double lon;
  final String country;
  final String state;

  GeoDirection({
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  factory GeoDirection.fromJson(Map<String, dynamic> json) {
    return GeoDirection(
      lat: json['lat'] as double,
      lon: json['lon'] as double,
      country: json['country'] as String,
      state: json['state'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lon': lon,
    'country': country,
    'state': state,
  };

  GeoDirection copyWith({
    double? lat,
    double? lon,
    String? country,
    String? state,
  }) {
    return GeoDirection(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }

  @override
  String toString() {
    return 'Location{lat: $lat, lon: $lon, country: $country, state: $state}';
  }
}
