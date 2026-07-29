import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/weather_model.dart';

class WeatherServices {

  final String apiKey = 'aeef9a2bdb4d24cdda1f27cb307ad70c';

  Future<Weather> freatchWeather(String cityName) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

    final response = await http.get(url);

    if (response.statusCode == 200){
      return Weather.fromJson(json.decode(response.body));
    } else{
      throw Exception('Failed to load weather data');
    }
  }
}