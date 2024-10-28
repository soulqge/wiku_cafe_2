import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ukk_andi/pages/order.dart';

class KeranjangButton extends StatelessWidget {
  final String itemName;
  final int quantity;
  final int price;
  final String image;

  KeranjangButton(
      {required this.itemName,
      required this.quantity,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OrderPage(
                  itemName: itemName,
                  quantity: quantity,
                  price: price,
                  image: image)),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        "Keranjang",
        style: GoogleFonts.sora(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
