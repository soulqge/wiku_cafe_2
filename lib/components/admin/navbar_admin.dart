
import 'package:flutter/material.dart';

class BottomNavAdmin extends StatefulWidget {
  final int selectedItem;
  const BottomNavAdmin({super.key, required this.selectedItem});

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {

  int _currentIndex = 0;

  void changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home_admin');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/user_admin');
    }
    else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/meja_admin');
    }
    else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/menu_admin');
    }
    else if (index == 4) {
      Navigator.pushReplacementNamed(context, '/transaksi_admin');
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
          icon: Icon(Icons.person_outline, ),
          label: 'User'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.table_bar_outlined, ),
          label: 'Meja'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood_rounded,),
          label: 'Menu'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.savings_outlined,),
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