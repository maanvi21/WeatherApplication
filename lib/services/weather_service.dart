// so basically this page gets infromation from weather api and if the response is successfull,
// the infromation is passed onto weather_model.dart in the form of a json object

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  const WeatherService({required this.apiKey});
  // we have created a future method
  Future<Weather> getWeather(String cityName) async {
    //Uses the http package to make a GET request (http.get) to the OpenWeatherMap API endpoint constructed using Uri.parse.
    final response = await http
        .get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
//If the HTTP response status code (response.statusCode) is 200, indicating success, the JSON response body (response.body) is decoded into a Dart object using jsonDecode.
//The decoded JSON data is then passed to the Weather.fromJson factory constructor to create a Weather object.
//This constructor maps the JSON fields (name, main.temp, weather[0].main) to the corresponding properties of the Weather class.
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  // adding another future method
  Future<String> getCurrenntCity() async {
    //location permission is a feature of geolocator package in flutter
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    //once we have got the current location from the user, fetch the current location
    // here, Position is a class and hence we are creating an instance
    // position is a variable name used to store an instance of the Position class. This instance contains the actual data representing the current position of the device, such as latitude and longitude coordinates.
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // then convert the location into a list of placemeark objects
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    //extract the city name from the first placemark
    String? city = placemarks[0].locality;
    // if the city is null
    return city ?? "";
  }
}
