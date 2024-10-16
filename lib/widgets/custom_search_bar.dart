// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:weather_app/widgets/custom_app_bar.dart';

// class CustomSearchBar extends StatefulWidget {
//   final String placeholder;
//   const CustomSearchBar({Key? key, required this.placeholder})
//       : super(key: key);

//   @override
//   State<CustomSearchBar> createState() => _CustomSearchBarState();
// }

// class _CustomSearchBarState extends State<CustomSearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             crossAxisAlignment:
//                 CrossAxisAlignment.center, // Center horizontally
//             mainAxisAlignment: MainAxisAlignment.start, // Align at the top
//             children: [
//               Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: GestureDetector(
//                     onTap: () => {print("Search Bar tapped")},
//                     child: Container(
//                       height: 50,
//                       width: 300,
//                       child: Row(
//                         children: [
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Icon(Icons.search),
//                           SizedBox(
//                             width: 15,
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(15),
//                             child: Text(widget.placeholder),
//                           )
//                         ],
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: Color.fromARGB(255, 231, 228, 228),
//                       ),
//                     ),
//                   ))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String placeholder;
  const CustomSearchBar({Key? key, required this.placeholder})
      : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  // search options, searchQuery and filteredOptions
  final List<String> _searchOptions = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Delhi',
    'Navi Mumbai'
        'Pune',
  ];
  // logic to filter out
  List<String> _filteredOptions = [];
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    // actually no need for this
                    print("Search bar tapped");
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                          _filteredOptions = _searchOptions
                              .where((option) => option
                                  .toLowerCase()
                                  .contains(_searchQuery.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: widget.placeholder,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor:
                            Color.fromARGB(255, 238, 236, 236).withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ),
              // Display dropdown suggestions
              if (_searchQuery.isNotEmpty && _filteredOptions.isNotEmpty)
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 238, 236, 236).withOpacity(0.5),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 239, 239, 239)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _filteredOptions.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_filteredOptions[index]),
                        onTap: () {
                          setState(() {
                            _searchQuery =
                                _filteredOptions[index]; // Set selected option
                            _filteredOptions.clear(); // Clear suggestions
                          });
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// imp logic to filter out
//  child: Container(
//                   height: 50,
//                   width: 300,
//                   child: TextField(
//                     onChanged: (value) {
//                       setState(() {
//                         _searchQuery = value;
//                         _filteredOptions = _searchOptions
//                             .where((option) => option
//                                 .toLowerCase()
//                                 .contains(_searchQuery.toLowerCase()))
//                             .toList();
//                       });
