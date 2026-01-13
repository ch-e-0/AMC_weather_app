import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherService {
  // Replace with your OpenWeatherMap API key.
  // You can also move this into secure storage or environment config.
  static const String _apiKey = '98722485fc20c02645b520503964428f';

  static Future<Weather> getWeather(String city) async {
    final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather', {
      'q': city,
      'appid': _apiKey,
      'units': 'metric',
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      // Try to surface a helpful error message
      String message = 'Failed to load weather for $city';
      try {
        final Map<String, dynamic> body = jsonDecode(response.body);
        if (body.containsKey('message')) {
          message = '${body['message']}';
        }
      } catch (_) {}
      throw Exception(message);
    }
  }
}