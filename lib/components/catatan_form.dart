import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatatanForm extends StatelessWidget {
  const CatatanForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catatan",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(134, 134, 134, 1)),
            hintText: "Tambahkan Catatan",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color.fromRGBO(216, 216, 216, 1)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Color.fromRGBO(216, 216, 216, 1), width: 2.0),
            ),
          ),
        ),
      ],
    );
  }
}
