import 'package:flutter/material.dart';
import 'package:weather_app/authentication/auth_home_page.dart';
import 'package:weather_app/pages/searchPage.dart';

import 'package:weather_app/pages/weatherpage.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SearchPage());
  }
}
