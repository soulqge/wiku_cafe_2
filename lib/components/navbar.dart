
import 'package:flutter/material.dart';

class BottomNavKasir extends StatefulWidget {
  final int selectedItem;
  const BottomNavKasir({super.key, required this.selectedItem});

  @override
  State<BottomNavKasir> createState() => _BottomNavKasirState();
}

class _BottomNavKasirState extends State<BottomNavKasir> {

  int _currentIndex = 0;

  void changeSelectedNavBar(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/order');
    }
    else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/history');
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
          icon: Icon(Icons.home_outlined,),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Order'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history, ),
          label: 'History'
        ),
      ],
      selectedItemColor: Color.fromRGBO(45, 133, 255, 1),
      unselectedItemColor: Colors.black26,
      currentIndex: widget.selectedItem,
      onTap: changeSelectedNavBar,
    );
  }
}