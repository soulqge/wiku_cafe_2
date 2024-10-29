import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InvoicePage extends StatefulWidget {
  final String itemName;
  final int quantity;
  final int price;
  final String image;
  final double total;
  final double tax;
  final int subtotal;

  InvoicePage(
      {super.key,
      required this.itemName,
      required this.image,
      required this.price,
      required this.quantity,
      required this.total,
      required this.tax,
      required this.subtotal});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  String namaKasir = "Andi";
  String namaPelanggan = "Eko";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Wikusama Cafe",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 27),
              Text(
                "Nama Pelanggan : $namaPelanggan",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              Text(
                "Nama Kasir : $namaKasir",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              Divider(
                color: Colors.black,
              ),
              Row(
                children: [
                  Text(
                    widget.itemName,
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  Expanded(child: Container()),
                  Text("${widget.quantity}X"),
                  SizedBox(width: 27),
                  Text("${currencyFormat.format(widget.subtotal)}")
                ],
              ),
              Row(
                children: [
                  Text(
                    "Tax (10%)",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  Expanded(child: Container()),
                  Text("${currencyFormat.format(widget.tax)}")
                ],
              ),
              Expanded(child: Container()),
              Row(
                children: [
                  Text(
                    "Total Harga",
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "${currencyFormat.format(widget.total)}",
                    style: GoogleFonts.poppins(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 27),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "Selesai",
                      style: GoogleFonts.poppins(fontSize: 12),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
