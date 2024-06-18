import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// we have created a weather class which consists of 3 properties
//The factory constructor fromJson is designed to create
//an instance of Weather from a JSON object.
//basically instances are created so that they can access all the features of a package or file
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
  // it is extracting information from the json file
  //Using JSON here allows the Weather class to:
//Easily convert API responses into Dart objects.
//Work with structured weather data in a way that integrates seamlessly with the rest of your Dart/Flutter application.
//Simplify data handling and access, making it easier to build features that use this data.

  factory Weather.fromJson(Map<String, dynamic> json) {
    //factory: Indicates that this constructor does not necessarily return a new instance of the class directly. It provides flexibility in how objects are created.
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
