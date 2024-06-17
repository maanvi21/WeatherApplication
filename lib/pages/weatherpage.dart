import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({Key? key}) : super(key: key);

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  final _weatherService =
      WeatherService(apiKey: '1e864bc6efb3ec1143b517a5c2005ad2');
  Weather? _weather;

  @override
  void initState() {
    super.initState();
    _fetchWeather(); // Fetch weather data when widget initializes
  }

  // Fetch weather data for the current city
  _fetchWeather() async {
    try {
      // Get the current city
      String cityName = await _weatherService.getCurrenntCity();
      // Get the weather for the city
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //city name
            Text(_weather?.cityName ?? "Loading city..."),
            //temprature
            Text('${_weather?.temperature.round()} °C')
          ],
        ),
      ),
    );
  }
}
