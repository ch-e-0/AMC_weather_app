class Weather {
  final String city;
  final double temperature;
  final String description;
  final int humidity;
  final double windSpeed;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] ?? '',
      temperature: ((json['main']?['temp'] ?? 0) as num).toDouble(),
      description: (json['weather'] != null && json['weather'].isNotEmpty)
          ? (json['weather'][0]['description'] ?? '')
          : '',
      humidity: ((json['main']?['humidity'] ?? 0) as num).toInt(),
      windSpeed: ((json['wind']?['speed'] ?? 0) as num).toDouble(),
    );
  }
}