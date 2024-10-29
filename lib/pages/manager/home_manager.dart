import 'package:flutter/material.dart';
import 'package:ukk_andi/components/admin/appbar_admin.dart';
import 'package:ukk_andi/components/manager/manager_information.dart';
import 'package:ukk_andi/components/manager/navbar_manager.dart';


class HomeManagerPage extends StatelessWidget {
  const HomeManagerPage({super.key});

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
                ManagerInformation(
                    title: "Total User", 
                    total: 8, 
                    route: '/user_manager'), // custom components
                Expanded(child: Container()),
                ManagerInformation(
                    title: "Total Transaksi",
                    total: 10,
                    route: '/transaki_manager'), // custom components
              ],
            ),
          ),
          SizedBox(height: 44),
        ],
      ),
      bottomNavigationBar: BottomNavManager(selectedItem: 0), // custom navbar
    );
  }
}
