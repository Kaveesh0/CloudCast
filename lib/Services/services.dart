import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_application/Model/weather_model.dart';

class WeatherServices {
  Future<WeatherData> fetchWeather() async {
    try {
      final response = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=5.95&lon=80.53&appid=dc3e0dc31d3ff7d234c9f068c47ac77c"),
      );

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherData.fromJson(json);
      } else {
        throw Exception('Failed to load Weather data');
      }
    } catch (e) {
      print('Error fetching weather data: ${e.toString()}');
      return WeatherData(
        name: '',
        temperature: Temperature(current: 0.0),
        humidity: 0,
        wind: Wind(speed: 0.0),
        maxTemperature: 0,
        minTemperature: 0,
        pressure: 0,
        seaLevel: 0,
        weather: [],
      );
    }
  }
}
