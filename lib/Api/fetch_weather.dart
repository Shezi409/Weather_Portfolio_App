import 'dart:convert';

import '../Model/weather_data.dart';
import 'package:http/http.dart' as http;

import '../Model/weather_data_current.dart';
import '../Model/weather_data_daily.dart';
import '../Model/weather_data_hourly.dart';
import '../Utils/api_url.dart';
import 'api_key.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon) async {
    var response = await http.get(Uri.parse(apiURl(lat, lon)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));

    return weatherData!;
  }
}
