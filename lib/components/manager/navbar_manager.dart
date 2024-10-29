
import 'package:flutter/material.dart';

class BottomNavManager extends StatefulWidget {
  final int selectedItem;
  const BottomNavManager({super.key, required this.selectedItem});

  @override
  State<BottomNavManager> createState() => _BottomNavManagerState();
}

class _BottomNavManagerState extends State<BottomNavManager> {

  int _currentIndex = 0;

  void changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home_manager');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/user_manager');
    }
    else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/transaki_manager');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Dashboard'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline,),
          label: 'User'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings_outlined ),
          label: 'Transaksi'
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black26,
      currentIndex: widget.selectedItem,
      onTap: changeSelectedNavBar,
    );
  }
}