import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/admin/formbox_admin.dart';
import 'package:ukk_andi/components/admin/role_dropdown.dart';


class TambahUpdateMenu extends StatelessWidget {

  final String title;

  const TambahUpdateMenu({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(children: [
        Text(title,
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 44),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(27, 174, 118, 1)),
                  borderRadius: BorderRadius.circular(12)),
              child: Icon(
                Icons.add,
                color: Color.fromRGBO(27, 174, 118, 1),
                size: 64,
              )),
        ),
        SizedBox(height: 8),
        Text("Upload Image",
            style: GoogleFonts.poppins(
                fontSize: 12, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),
        FormboxAdmin(hintForm: "Nama Menu"),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: FormboxAdmin(hintForm: "Harga")),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: RoleDropdown(
                label: "Jenis",
                items: ["Makanan", "Minuman"],
                onChanged: (value) {
                  print("Selected role: $value");
                },
              ),
            ),
          ],
        ),
        Expanded(child: Container()),
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
    );
  }
}
