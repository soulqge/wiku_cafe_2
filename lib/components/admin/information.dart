import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatelessWidget {
  final String title;
  final int total;
  final Widget bottomSheetContent; 

  const Information({
    super.key,
    required this.title,
    required this.total,
    required this.bottomSheetContent, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 16),
          Text(
            total.toString(),
            style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => bottomSheetContent, // Display custom content
              );
            },
            child: Text(
              "Tambah",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
