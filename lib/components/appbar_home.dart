import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarHome extends StatelessWidget {
  const AppbarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(
                'https://cdn.rri.co.id/berita/1/images/1686230102349-FxnfiRqWAAAwucp/1686230102349-FxnfiRqWAAAwucp.jpg'),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good Afternoon!",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
              ),
              Text(
                "Andi",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[200],
            ),
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
