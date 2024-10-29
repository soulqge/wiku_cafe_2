import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/admin/navbar_admin.dart';
import 'package:ukk_andi/components/admin/tambah_update_menu.dart';

class MenuAdminPage extends StatefulWidget {
  const MenuAdminPage({super.key});

  @override
  State<MenuAdminPage> createState() => _MenuAdminPageState();
}

class _MenuAdminPageState extends State<MenuAdminPage> {

  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  final List<Map<String, dynamic>> drinkItems = [
    {
      "name": "Caramel Coffee Jelly Frappucino",
      "description": "Minuman",
      "price": 12000,
      "image": "assets/gambar1.png"
    },
    {
      "name": "Chocolatte",
      "description": "Minuman",
      "price": 10000,
      "image": "assets/gambar2.png"
    },
    {
      "name": "Choco Oreo",
      "description": "Minuman",
      "price": 13000,
      "image": "assets/gambar3.png"
    },
    {
      "name": "Milkshake Vanilla",
      "description": "Minuman",
      "price": 12000,
      "image": "assets/gambar4.png"
    },
  ];

  final List<Map<String, dynamic>> foodItems = [
    {
      "name": "Rendang",
      "description": "Makanan",
      "price": 20000,
      "image": "assets/gambar5.png"
    },
    {
      "name": "Ayam Kuah Pedas",
      "description": "Makanan",
      "price": 15000,
      "image": "assets/gambar6.png"
    },
    {
      "name": "Ayam Kecap",
      "description": "Makanan",
      "price": 15000,
      "image": "assets/gambar7.png"
    },
    {
      "name": "Udang Tumis",
      "description": "Makanan",
      "price": 20000,
      "image": "assets/gambar8.png"
    },
  ];

  void _deleteItem(List<Map<String, dynamic>> items, int index) {
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item deleted')),
    );
  }

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
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [AppbarAdmin(title: "Menu")],
                ),
              ),
            ),
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(text: "Drinks"),
                Tab(text: "Food"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  buildMenuList(drinkItems, _deleteItem,  currencyFormat),
                  buildMenuList(foodItems, _deleteItem,  currencyFormat)
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavAdmin(selectedItem: 3),
      ),
    );
  }
}

Widget buildMenuList(List<Map<String, dynamic>> items, Function deleteItem, NumberFormat currencyFormat) {
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
                // Image container
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    item['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16), // Space between image and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item['description'],
                        style: GoogleFonts.sora(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${currencyFormat.format(item['price'])}',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => TambahUpdateMenu(title: "Update Menu"),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Update"),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => deleteItem(items, index),
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

