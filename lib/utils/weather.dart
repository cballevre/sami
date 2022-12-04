import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sami/models/weather.dart';

class WeatherHelper {
  static Future<Weather> fetch(String latitude, String longitude) async {

    final response = await http
        .get(Uri.parse('https://marine-api.open-meteo.com/v1/marine?latitude=$latitude&longitude=$longitude&hourly=wave_height,wave_direction'));

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}