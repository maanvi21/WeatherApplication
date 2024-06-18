import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/custom_app_bar.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({Key? key}) : super(key: key);

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  final _weatherService =
      WeatherService(apiKey: '1e864bc6efb3ec1143b517a5c2005ad2');
  Weather? _weather;
// for weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/animations/sunny_lottie.json';
    // using a switch statement to match the animations with the weather conditions
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/animations/cloudy_lottie.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/animations/rainy_lotty.json';
      case 'thunder storm':
        return 'assets/animations/thunder_lotty.json';
      case 'clear':
        return 'assets/animations/sunny_lotty.json';
      default:
        return 'assets/animations/sunny_lotty.json';
    }
  }

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
        body: Column(children: [
      const SizedBox(height: 50),
      const CustomAppBar(
        title: "Check the Weather at your Location",
        titleColor: Colors.black,
      ),
      Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //city name
              Text(_weather?.cityName ?? "Loading city..."),
              //animations
              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),
              //temprature
              Text('${_weather?.temperature.round()} °C'),
              //weather condition to match with the animation
              Text(_weather?.mainCondition ?? "")
            ],
          ),
        ),
      )
    ]));
  }
}
