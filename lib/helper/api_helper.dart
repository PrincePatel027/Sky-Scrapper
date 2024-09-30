import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/weather_model.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Future<WeatherModel?> getApi({required String location}) async {
    String api =
        "https://api.weatherapi.com/v1/current.json?key=3cd73ba36dd847d98a4100033242607&q=$location&aqi=no";

    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    }
    return null;
  }
}
