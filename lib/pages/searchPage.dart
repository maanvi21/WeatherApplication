import 'package:flutter/material.dart';
import 'package:weather_app/widgets/custom_app_bar.dart';
import 'package:weather_app/widgets/custom_search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppBar(title: "Search for", titleColor: Colors.black54),
              // Adding a Container to visually check if CustomSearchBar is rendered
              Container(
                color: Colors.blue[100], // Light blue background for visibility
                padding: EdgeInsets.all(16.0), // Padding for better spacing
                child: CustomSearchBar(
                  placeholder: "Search for weather in...",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
