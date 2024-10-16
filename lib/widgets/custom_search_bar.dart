import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/widgets/custom_app_bar.dart';

class CustomSearchBar extends StatefulWidget {
  final String placeholder;
  const CustomSearchBar({Key? key, required this.placeholder})
      : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [],
      ),
    )));
  }
}
