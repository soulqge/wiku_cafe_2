import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:ukk_andi/components/keranjang_button.dart';

class DetailMenuPage extends StatefulWidget {
  final Map<String, dynamic> item;

  DetailMenuPage({required this.item});

  @override
  _DetailMenuPageState createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  // Variables to store selected options
  String selectedCupSize = "Besar";
  String selectedIce = "60%";
  String selectedSugar = "60%";
  int basePrice = 0;
  int quantity = 1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    basePrice = widget.item['price'];
    totalPrice = (basePrice + _getCupSizePrice(selectedCupSize)) * quantity;
  }

  int _getCupSizePrice(String cupSize) {
    switch (cupSize) {
      case 'Kecil':
        return 0;
      case 'Sedang':
        return 2000;
      case 'Besar':
        return 4000;
      default:
        return 0;
    }
  }

  void _updateTotalPrice() {
    setState(() {
      totalPrice = (basePrice + _getCupSizePrice(selectedCupSize)) * quantity;
    });
  }

  void _incrementQuantity() {
    setState(() {
      quantity++;
      _updateTotalPrice();
    });
  }

  void _decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        _updateTotalPrice();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    child: Image.asset(
                      widget.item['image'],
                      height: MediaQuery.of(context).size.height * 0.25,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      currencyFormat.format(widget.item['price']),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildOptionsSection(
                      title: "Ukuran Cup",
                      options: ["Kecil", "Sedang", "Besar"],
                      selectedOption: selectedCupSize,
                      onOptionSelected: (value) {
                        setState(() {
                          selectedCupSize = value;
                          _updateTotalPrice();
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    _buildOptionsSection(
                      title: "Takaran Es",
                      options: ["0%", "30%", "60%", "100%"],
                      selectedOption: selectedIce,
                      onOptionSelected: (value) {
                        setState(() {
                          selectedIce = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    _buildOptionsSection(
                      title: "Takaran Gula",
                      options: ["0%", "30%", "60%", "100%"],
                      selectedOption: selectedSugar,
                      onOptionSelected: (value) {
                        setState(() {
                          selectedSugar = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Jumlah",
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: _decrementQuantity,
                        ),
                        Text(
                          "$quantity",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: _incrementQuantity,
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Pesanan\n${currencyFormat.format(totalPrice)}",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    KeranjangButton(
                        itemName: widget.item['name'],
                        quantity: quantity,
                        price: totalPrice,
                        image: widget.item['image'])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsSection({
    required String title,
    required List<String> options,
    required String selectedOption,
    required ValueChanged<String> onOptionSelected,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: options.map((option) {
            return ChoiceChip(
              label: Text(
                option,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
              selected: selectedOption == option,
              onSelected: (bool selected) {
                if (selected) {
                  onOptionSelected(option);
                }
              },
              selectedColor: Colors.blue,
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(
                color: selectedOption == option ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
