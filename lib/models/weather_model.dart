import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  const Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });
  // here we have added a factory constructor
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
