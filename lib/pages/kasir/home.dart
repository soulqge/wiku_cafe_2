import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ukk_andi/components/appbar_home.dart';
import 'package:ukk_andi/components/navbar.dart';
import 'package:ukk_andi/components/search_bar.dart';
import 'package:ukk_andi/pages/kasir/detail_menu.dart';
import 'package:ukk_andi/pages/kasir/food_detail.dart';

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
  }, // data minuman
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
  }, //data makanan
];

class HomePageKasir extends StatefulWidget {
  const HomePageKasir({super.key});

  @override
  State<HomePageKasir> createState() => _HomePageState();
}

class _HomePageState extends State<HomePageKasir> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              AppbarHome(), // custom components
              SearchBarHome(hint: 'What would you like to buy today?',), // custom components
              PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: TabBar(
                  indicatorColor: Colors.blue,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(text: "Drinks"),
                    Tab(text: "Food"),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    buildMenuList(drinkItems), // custom widgets
                    buildMenuList(foodItems),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavKasir(selectedItem: 0), // custom navbar
      ),
    );
  }
}

Widget buildMenuList(List<Map<String, dynamic>> items) {
  final NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0); // format rupiah

  return GridView.builder( //biar bisa buat row sesuai jumlah data
    padding: const EdgeInsets.all(16.0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 5.0,
      childAspectRatio: 0.75,
    ),
    itemCount: items.length,
    itemBuilder: (context, index) {
      final item = items[index];
      return GestureDetector(
        onTap: () {
          if (item['description'] == "Minuman") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailMenuPage(item: item),
              ),
            );
          } else if (item['description'] == "Makanan") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailPage(item: item), 
              ), //mindahin data ke halaman berikutnya
            );
          }
        },
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  item['image'],
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['name'],
                      style: GoogleFonts.sora(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      item['description'],
                      style: GoogleFonts.sora(fontSize: 12, color: Colors.grey),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      currencyFormat.format(item['price']),
                      style: GoogleFonts.poppins(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
