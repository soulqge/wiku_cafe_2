import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarAdmin extends StatelessWidget {
  final String title;

  const AppbarAdmin({super.key, required this.title});

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Logout", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          content: Text("Are you sure you want to logout?", style: GoogleFonts.poppins()),
          actions: <Widget>[
            TextButton(
              child: Text("No", style: GoogleFonts.poppins(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes", style: GoogleFonts.poppins(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushNamed(context, '/login'); // Navigate to login
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Expanded(child: Container()),
        IconButton(
          onPressed: () {
            _showLogoutConfirmation(context);
          },
          icon: Icon(
            Icons.logout,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
