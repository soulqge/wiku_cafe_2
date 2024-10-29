import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/manager/navbar_manager.dart';
import 'package:ukk_andi/components/search_bar.dart';

class TransaksiManagerPage extends StatefulWidget {
  const TransaksiManagerPage({super.key});

  @override
  State<TransaksiManagerPage> createState() => _TransaksiManagerPagePageState();
}

class _TransaksiManagerPagePageState extends State<TransaksiManagerPage> {
  final List<Map<String, dynamic>> belumLunas = [
    {"id": "Ch8U59F8n2", "name": "Makanan", "status": "Belum Lunas"},
    {"id": "YZllP3REnI", "name": "Makanan", "status": "Belum Lunas"},
    {"id": "rUyzQQsBFS", "name": "Makanan", "status": "Belum Lunas"},
    {"id": "68ac1qeaXO", "name": "Makanan", "status": "Belum Lunas"},
    {"id": "fnYS7kI4tG", "name": "Makanan", "status": "Belum Lunas"},
  ];

  final List<Map<String, dynamic>> sudahLunas = [
    {"id": "Zz9LB61SRT", "name": "Minuman", "status": "Lunas"},
    {"id": "pUo3zGDWgH", "name": "Minuman", "status": "Lunas"},
    {"id": "kjsB2tocwk", "name": "Minuman", "status": "Lunas"},
    {"id": "Pj9a88XcDp", "name": "Minuman", "status": "Lunas"},
    {"id": "mHTx3gRapc", "name": "Minuman", "status": "Lunas"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              color: Colors.blue,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    AppbarAdmin(title: "Transaksi"),
                    SizedBox(height: 10),
                    SearchBarHome(hint: 'Search',),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            "31/03/2023",
                            style: GoogleFonts.sora(
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        ),
                        Icon(Icons.arrow_right_alt, color: Colors.white,),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)
                          ),
                          child: Text(
                            "31/03/2024",
                            style: GoogleFonts.sora(
                                fontSize: 16,
                                color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: "Sudah Bayar"),
                Tab(text: "Belum Bayar"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildMenuList(sudahLunas),
                  buildMenuList(belumLunas)
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavManager(selectedItem: 2),
      ),
    );
  }
}

Widget buildMenuList(List<Map<String, dynamic>> items) {
  return ListView.builder(
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['id'],
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item['name'],
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 32),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: item['status'] == "Belum Lunas"
                            ? Colors.red
                            : Color.fromRGBO(27, 174, 118, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item['status'],
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
