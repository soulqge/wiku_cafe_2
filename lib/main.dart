import 'package:flutter/material.dart';
import 'package:ukk_andi/pages/admin/home_admin.dart';
import 'package:ukk_andi/pages/admin/meja_admin.dart';
import 'package:ukk_andi/pages/admin/menu_admin.dart';
import 'package:ukk_andi/pages/admin/transaksi_admin.dart';
import 'package:ukk_andi/pages/admin/user_admin.dart';
import 'package:ukk_andi/pages/kasir/history.dart';
import 'package:ukk_andi/pages/kasir/home.dart';
import 'package:ukk_andi/pages/login.dart';
import 'package:ukk_andi/pages/manager/home_manager.dart';
import 'package:ukk_andi/pages/manager/transaksi_manager.dart';
import 'package:ukk_andi/pages/manager/user_manager.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login' : (context) => LoginPage(),
      '/home' : (context) => HomePageKasir(),
      '/history' : (context) => HistoryPage(),

      //admin
      '/home_admin': (context) => HomeAdminPage(),
      '/user_admin': (context) => UserAdminPage(),
      '/meja_admin' : (context) => MejaAdminPage(),
      '/menu_admin' : (context) => MenuAdminPage(),
      '/transaksi_admin' : (context) => TransaksiAdminPage(),

      //manager
      '/home_manager' : (context) => HomeManagerPage(),
      '/user_manager' : (context) => UserManagerPage(),
      '/transaki_manager' : (context) => TransaksiManagerPage()

    },
  ));
}



