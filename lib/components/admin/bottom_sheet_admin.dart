import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/admin/formbox_admin.dart';
import 'package:ukk_andi/components/admin/role_dropdown.dart';


class BottomSheetAdmin extends StatelessWidget {
  final String title;

  const BottomSheetAdmin({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 44),
          FormboxAdmin(hintForm: "Username"),
          SizedBox(height: 20),
          FormboxAdmin(hintForm: "Email"),
          SizedBox(height: 20),
          FormboxAdmin(hintForm: "Password"),
          SizedBox(height: 20),
          RoleDropdown(
            label: "Role",
            items: ["Kasir", "Admin", "Manajer"],
            onChanged: (value) {
              print("Selected role: $value");
            },
          ),
          SizedBox(height: 72),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(27, 174, 118, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Tambah",
                style: GoogleFonts.sora(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
