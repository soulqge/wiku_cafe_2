import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ini History Page",
          style: GoogleFonts.poppins(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
      ),
    );
  }
}
