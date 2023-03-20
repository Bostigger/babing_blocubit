class WeatherInfo {
  final double lat;
  final double lon;
  final int weatherId;
  final String main;
  final String description;
  final String icon;
  final double tempMin;
  final double tempMax;

  WeatherInfo({
    required this.lat,
    required this.lon,
    required this.weatherId,
    required this.main,
    required this.description,
    required this.icon,
    required this.tempMin,
    required this.tempMax,
  });

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
      weatherId: json['weather'][0]['id'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
    );
  }

  WeatherInfo copyWith({
    double? lat,
    double? lon,
    int? weatherId,
    String? main,
    String? description,
    String? icon,
    double? tempMin,
    double? tempMax,
  }) {
    return WeatherInfo(
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      weatherId: weatherId ?? this.weatherId,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': {'lat': lat, 'lon': lon},
      'weather': [
        {
          'id': weatherId,
          'main': main,
          'description': description,
          'icon': icon,
        }
      ],
      'main': {
        'temp_min': tempMin,
        'temp_max': tempMax,
      },
    };
  }

  @override
  String toString() {
    return 'WeatherInfo{lat: $lat, lon: $lon, weatherId: $weatherId, main: $main, description: $description, icon: $icon, tempMin: $tempMin, tempMax: $tempMax}';
  }

  static WeatherInfo fromJsonMap(Map<String, dynamic> json) {
    return WeatherInfo(
      lat: json['coord']['lat'],
      lon: json['coord']['lon'],
      weatherId: json['weather'][0]['id'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
    );
  }
}
