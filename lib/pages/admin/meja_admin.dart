import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/admin/navbar_admin.dart';
import 'package:ukk_andi/components/admin/tambah_update_meja.dart';

class MejaAdminPage extends StatefulWidget {
  MejaAdminPage({super.key});

  @override
  State<MejaAdminPage> createState() => _MejaAdminPageState();
}

class _MejaAdminPageState extends State<MejaAdminPage> {
  final List<Map<String, dynamic>> tables = [
    {"number": "1", "status": "Tersedia"},
    {"number": "2", "status": "Terisi"},
    {"number": "3", "status": "Tersedia"},
    {"number": "4", "status": "Terisi"},
    {"number": "5", "status": "Tersedia"},
  ]; // data meja

  void _deleteTable(int index) {
    setState(() {
      tables.removeAt(index);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Meja deleted')),
      );
    });
  } // fungsi hapus meja

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  AppbarAdmin(title: "Meja"), // custom components
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: tables.length,
              itemBuilder: (context, index) {
                final table = tables[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            table["number"],
                            style: GoogleFonts.sora(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: table["status"] == "Tersedia"
                                    ? Colors.green
                                    : Colors.grey,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                table["status"],
                                style: GoogleFonts.sora(
                                  color: table["status"] == "Tersedia"
                                      ? Colors.green
                                      : Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) =>
                                      TambahUpdateMeja(title: "Update Meja"),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Update"),
                            ),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                _deleteTable(index);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text("Delete"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ), // nampilin kontainer sesuai jumlah data
          ),
        ],
      ),
      bottomNavigationBar: BottomNavAdmin(selectedItem: 2), // custom navbar
    );
  }
}
