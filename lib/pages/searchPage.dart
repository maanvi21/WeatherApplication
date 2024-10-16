import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_app_bar.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomAppBar(title: "Search for", titleColor: Colors.black54)
        ],
      ),
    )));
  }
}
