import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarHome extends StatelessWidget {

  final String hint;

  const SearchBarHome({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              color: Color.fromRGBO(134, 134, 134, 1),
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              fontSize: 10,
              color: Color.fromRGBO(134, 134, 134, 1),
            ),
            border: InputBorder.none, // No visible border
          ),
          onChanged: (query) {
            // Handle search logic here
            print("Searching for: $query");
          },
        ),
      ),
    );
  }
}
