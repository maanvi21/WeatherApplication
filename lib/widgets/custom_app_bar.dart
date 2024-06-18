import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final Color titleColor;
  const CustomAppBar({Key? key, required this.title, required this.titleColor})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_sharp,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ],
        )
      ],
    );
  }
}
