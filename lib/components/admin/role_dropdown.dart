import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoleDropdown extends StatefulWidget {
  final String label;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? selectedItem;

  const RoleDropdown({
    Key? key,
    required this.label,
    required this.items,
    this.onChanged,
    this.selectedItem,
  }) : super(key: key);

  @override
  _RoleDropdownState createState() => _RoleDropdownState();
}

class _RoleDropdownState extends State<RoleDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          items: widget.items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(
                item,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color.fromRGBO(27, 174, 118, 1),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color.fromRGBO(27, 174, 118, 1),
                width: 2,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
          dropdownColor: Colors.white,
          icon: Icon(Icons.arrow_drop_down, color: Color.fromRGBO(27, 174, 118, 1)),
        ),
      ],
    );
  }
}
