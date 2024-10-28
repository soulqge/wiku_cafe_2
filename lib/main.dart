import 'package:flutter/material.dart';
import 'package:ukk_andi/pages/history.dart';
import 'package:ukk_andi/pages/home.dart';
import 'package:ukk_andi/pages/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/login' : (context) => LoginPage(),
      '/home' : (context) => HomePage(),
      '/history' : (context) => HistoryPage()
    },
  ));
}



