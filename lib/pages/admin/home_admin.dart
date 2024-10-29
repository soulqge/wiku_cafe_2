import 'package:flutter/material.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/admin/bottom_sheet_admin.dart';
import 'package:ukk_andi/components/admin/information.dart';
import 'package:ukk_andi/components/admin/navbar_admin.dart';
import 'package:ukk_andi/components/admin/tambah_update_meja.dart';
import 'package:ukk_andi/components/admin/tambah_update_menu.dart';


class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppbarAdmin(title: "Dashboard"), // custom components
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Information(
                  title: "Total User",
                  total: 8,
                  bottomSheetContent: BottomSheetAdmin(title: "Tambah User")
                ), // custom components
                Expanded(child: Container()),
                Information(
                  title: "Total Meja",
                  total: 5,
                  bottomSheetContent: TambahUpdateMeja(title: 'Tambah Meja',)
                ) // custom components
              ],
            ),
          ),
          SizedBox(height: 44),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Information(
                  title: "Total Transaksi",
                  total: 10,
                  bottomSheetContent: Center(child: Text("Lihat Transaksi")),
                ), // custom components
                Expanded(child: Container()),
                Information(
                  title: "Total Menu",
                  total: 8,
                  bottomSheetContent: TambahUpdateMenu(title: 'Tambah Menu',)
                ) // custom components
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavAdmin(selectedItem: 0), // custom navbar
    );
  }
}
